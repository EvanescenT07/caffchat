import 'package:caffchat/core/utils/app_logger.dart';
import 'package:caffchat/data/models/chat/chat_conversation_model.dart';
import 'package:caffchat/data/models/chat/chat_message_model.dart';
import 'package:caffchat/domain/entities/chat/chat_conversation.dart';
import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/domain/entities/chat/conversation_type.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:caffchat/domain/entities/chat/message_type.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/repositories/chat/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreChatRepository
    implements ChatRepository {
  final FirebaseFirestore _firestore;

  FirestoreChatRepository({
    FirebaseFirestore? firestore,
  }) : _firestore =
           firestore ??
           FirebaseFirestore.instance;

  CollectionReference<
    Map<String, dynamic>
  >
  get _conversationsRef => _firestore
      .collection('conversations');

  CollectionReference<
    Map<String, dynamic>
  >
  _messagesRef(String conversationId) =>
      _conversationsRef
          .doc(conversationId)
          .collection('messages');

  @override
  Stream<List<ChatConversation>>
  watchConversations(String userId) {
    return _conversationsRef
        .where(
          'participants',
          arrayContains: userId,
        )
        .orderBy(
          'lastMessageTime',
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) =>
                    ChatConversationModel.fromFirestore(
                      doc,
                    ).toEntity(),
              )
              .toList(),
        );
  }

  @override
  Stream<List<ChatMessage>>
  watchMessages(String conversationId) {
    return _messagesRef(conversationId)
        .orderBy(
          'createdAt',
          descending: false,
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) =>
                    ChatMessageModel.fromFirestore(
                      doc,
                      conversationId:
                          conversationId,
                    ).toEntity(),
              )
              .toList(),
        );
  }

  @override
  Future<Result<ChatMessage>>
  sendMessage({
    required String conversationId,
    required String senderId,
    required String content,
    required MessageType type,
  }) async {
    try {
      final messageModel =
          ChatMessageModel(
            id: '',
            conversationId:
                conversationId,
            senderId: senderId,
            content: content,
            type: type,
            status: MessageStatus.sent,
            createdAt: DateTime.now(),
          );

      // Write message to subcollection
      final docRef = await _messagesRef(
        conversationId,
      ).add(messageModel.toFirestore());

      // Update parent conversation with last mesage and increment unread for other participants
      final conversationDoc =
          await _conversationsRef
              .doc(conversationId)
              .get();

      if (conversationDoc.exists) {
        final data = conversationDoc
            .data()!;
        final participants =
            List<String>.from(
              data['participants']
                      as List? ??
                  [],
            );
        final currentUnread =
            Map<String, int>.from(
              data['unreadCount']
                      as Map? ??
                  {},
            );

        // Increment unread for everyone except sender
        for (final uid
            in participants) {
          if (uid != senderId) {
            currentUnread[uid] =
                (currentUnread[uid] ??
                    0) +
                1;
          }
        }

        await _conversationsRef
            .doc(conversationId)
            .update({
              'lastMessage': content,
              'lastMessageTime':
                  FieldValue.serverTimestamp(),
              'lastMessageSenderId':
                  senderId,
              'lastMessageStatus':
                  MessageStatus
                      .sent
                      .name,
              'unreadCount':
                  currentUnread,
            });
      }

      final savedMessage = ChatMessage(
        id: docRef.id,
        conversationId: conversationId,
        senderId: senderId,
        content: content,
        type: type,
        status: MessageStatus.sent,
        createdAt: DateTime.now(),
      );
      return Result.success(
        savedMessage,
      );
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to send message',
        error: e,
      );
      return Result.failed(
        'Failed to send message: ${e.message}',
      );
    }
  }

  @override
  Future<Result<void>> markAsRead({
    required String conversationId,
    required String userId,
  }) async {
    try {
      await _conversationsRef
          .doc(conversationId)
          .update({
            'unreadCount.$userId': 0,
          });
      return Result.success(null);
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to mark conversation as read',
        error: e,
      );
      return Result.failed(
        'Failed to mark conversation as read: ${e.message}',
      );
    }
  }

  @override
  Future<Result<ChatConversation>>
  getOrCreateDirectConversation({
    required String currentUserId,
    required String otherUserId,
  }) async {
    try {
      // Deterministic ID: sorted UIDs joined with underscore
      final sortedUids = [
        currentUserId,
        otherUserId,
      ]..sort();
      final conversationId = sortedUids
          .join('_');
      final docRef = _conversationsRef
          .doc(conversationId);
      final existingDoc = await docRef
          .get();
      if (existingDoc.exists) {
        return Result.success(
          ChatConversationModel.fromFirestore(
            existingDoc,
          ).toEntity(),
        );
      }
      // Create new — use set() not add() for idempotency
      final newConversation =
          ChatConversationModel(
            id: conversationId,
            participants: sortedUids,
            type:
                ConversationType.direct,
          );
      await docRef.set(
        newConversation.toFirestore(),
      );
      final createdDoc = await docRef
          .get();
      return Result.success(
        ChatConversationModel.fromFirestore(
          createdDoc,
        ).toEntity(),
      );
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to get/create conversation',
        error: e,
      );
      return Result.failed(
        'Failed to create conversation: ${e.message}',
      );
    }
  }
}
