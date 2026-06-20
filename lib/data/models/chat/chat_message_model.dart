import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:caffchat/domain/entities/chat/message_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Handles Firestore serialization for ChatMessage.
/// Lives in subcollection: conversations/{id}/messages/{id}
class ChatMessageModel {
  final String id;
  final String conversationId;
  final String senderId;
  final String content;
  final MessageType type;
  final MessageStatus status;
  final DateTime createdAt;

  const ChatMessageModel({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    this.type = MessageType.text,
    this.status = MessageStatus.sent,
    required this.createdAt,
  });

  factory ChatMessageModel.fromFirestore(
    DocumentSnapshot<
      Map<String, dynamic>
    >
    doc, {
    required String conversationId,
  }) {
    final data = doc.data()!;
    return ChatMessageModel(
      id: doc.id,
      conversationId: conversationId,
      senderId:
          data['senderId'] as String,
      content:
          data['content'] as String? ??
          '',
      type: MessageType.fromString(
        data['type'] as String? ??
            'text',
      ),
      status: MessageStatus.fromString(
        data['status'] as String? ??
            'sent',
      ),
      createdAt:
          (data['createdAt']
                  as Timestamp?)
              ?.toDate() ??
          DateTime.now(),
    );
  }

  /// For writing to Firestore. Excludes `id`
  /// and `conversationId`
  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'content': content,
      'type': type.name,
      'status': status.name,
      'createdAt':
          FieldValue.serverTimestamp(),
    };
  }

  ChatMessage toEntity() {
    return ChatMessage(
      id: id,
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      createdAt: createdAt,
    );
  }

  factory ChatMessageModel.fromEntity(
    ChatMessage entity,
  ) {
    return ChatMessageModel(
      id: entity.id,
      conversationId:
          entity.conversationId,
      senderId: entity.senderId,
      content: entity.content,
      type: entity.type,
      status: entity.status,
      createdAt: entity.createdAt,
    );
  }
}
