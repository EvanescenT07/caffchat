import 'package:caffchat/domain/entities/chat/chat_conversation.dart';
import 'package:caffchat/domain/entities/chat/conversation_type.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Handles Firestore serialization for ChatConversation.
/// Separates Firestore-specific concerns (Timestamp, doc ID)
/// from domain entity.
class ChatConversationModel {
  final String id;
  final List<String> participants;
  final String lastMessage;
  final DateTime? lastMessageTime;
  final String? lastMessageSenderId;
  final MessageStatus lastMessageStatus;
  final ConversationType type;
  final String? title;
  final List<String> pinnedBy;
  final Map<String, int> unreadCount;
  final Map<String, bool> typing;
  final Map<String, DateTime>
  participantsLastRead;
  final DateTime? createdAt;

  const ChatConversationModel({
    required this.id,
    required this.participants,
    this.lastMessage = '',
    this.lastMessageTime,
    this.lastMessageSenderId,
    this.lastMessageStatus =
        MessageStatus.sent,
    this.type = ConversationType.direct,
    this.title,
    this.pinnedBy = const [],
    this.unreadCount = const {},
    this.typing = const {},
    this.participantsLastRead =
        const {},
    this.createdAt,
  });

  factory ChatConversationModel.fromFirestore(
    DocumentSnapshot<
      Map<String, dynamic>
    >
    doc,
  ) {
    final data = doc.data()!;
    return ChatConversationModel(
      id: doc.id,
      participants: List<String>.from(
        data['participants'] as List? ??
            [],
      ),
      lastMessage:
          data['lastMessage']
              as String? ??
          '',
      lastMessageTime:
          (data['lastMessageTime']
                  as Timestamp?)
              ?.toDate(),
      lastMessageSenderId:
          data['lastMessageSenderId']
              as String?,
      lastMessageStatus:
          MessageStatus.fromString(
            data['lastMessageStatus']
                    as String? ??
                'sent',
          ),
      type: ConversationType.fromString(
        data['type'] as String? ??
            'direct',
      ),
      title: data['title'] as String?,
      pinnedBy: List<String>.from(
        data['pinnedBy'] as List? ?? [],
      ),
      unreadCount:
          Map<String, int>.from(
            data['unreadCount']
                    as Map? ??
                {},
          ),
      typing: Map<String, bool>.from(
        data['typing'] as Map? ?? {},
      ),
      participantsLastRead:
          _parseLastReadMap(
            data['participantsLastRead']
                as Map?,
          ),
      createdAt:
          (data['createdAt']
                  as Timestamp?)
              ?.toDate(),
    );
  }

  /// Converts Firestore `Map<String, Timestamp>` Dart `Map<String, DateTime>`
  static Map<String, DateTime>
  _parseLastReadMap(
    Map<dynamic, dynamic>? raw,
  ) {
    if (raw == null) return {};
    return raw.map((key, value) {
      final dateTime =
          value is Timestamp
          ? value.toDate()
          : DateTime.now();
      return MapEntry(
        key as String,
        dateTime,
      );
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime':
          lastMessageTime != null
          ? Timestamp.fromDate(
              lastMessageTime!,
            )
          : FieldValue.serverTimestamp(),
      'lastMessageSenderId':
          lastMessageSenderId,
      'lastMessageStatus':
          lastMessageStatus.name,
      'type': type.name,
      'title': title,
      'pinnedBy': pinnedBy,
      'unreadCount': unreadCount,
      'typing': typing,
      'participantsLastRead':
          participantsLastRead.map(
            (key, value) => MapEntry(
              key,
              Timestamp.fromDate(value),
            ),
          ),
      'createdAt': createdAt != null
          ? Timestamp.fromDate(
              createdAt!,
            )
          : FieldValue.serverTimestamp(),
    };
  }

  ChatConversation toEntity() {
    return ChatConversation(
      id: id,
      participants: participants,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      lastMessageSenderId:
          lastMessageSenderId,
      lastMessageStatus:
          lastMessageStatus,
      type: type,
      title: title,
      unreadCount: unreadCount,
      typing: typing,
      pinnedBy: pinnedBy,
      participantsLastRead:
          participantsLastRead,
      createdAt: createdAt,
    );
  }

  factory ChatConversationModel.fromEntity(
    ChatConversation entity,
  ) {
    return ChatConversationModel(
      id: entity.id,
      participants: entity.participants,
      lastMessage: entity.lastMessage,
      lastMessageSenderId:
          entity.lastMessageSenderId,
      lastMessageStatus:
          entity.lastMessageStatus,
      lastMessageTime:
          entity.lastMessageTime,
      type: entity.type,
      title: entity.title,
      unreadCount: entity.unreadCount,
      typing: entity.typing,
      pinnedBy: entity.pinnedBy,
      participantsLastRead:
          entity.participantsLastRead,
      createdAt: entity.createdAt,
    );
  }
}
