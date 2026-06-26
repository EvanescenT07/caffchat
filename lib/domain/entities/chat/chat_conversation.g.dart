// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatConversation _$ChatConversationFromJson(
  Map<String, dynamic> json,
) => _ChatConversation(
  id: json['id'] as String,
  participants: (json['participants'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  lastMessage: json['lastMessage'] as String? ?? '',
  lastMessageTime: json['lastMessageTime'] == null
      ? null
      : DateTime.parse(json['lastMessageTime'] as String),
  lastMessageSenderId: json['lastMessageSenderId'] as String?,
  lastMessageStatus:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['lastMessageStatus']) ??
      MessageStatus.sent,
  type:
      $enumDecodeNullable(_$ConversationTypeEnumMap, json['type']) ??
      ConversationType.direct,
  title: json['title'] as String?,
  pinnedBy:
      (json['pinnedBy'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  unreadCount:
      (json['unreadCount'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  typing:
      (json['typing'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {},
  participantsLastRead:
      (json['participantsLastRead'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, DateTime.parse(e as String)),
      ) ??
      const {},
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ChatConversationToJson(_ChatConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime?.toIso8601String(),
      'lastMessageSenderId': instance.lastMessageSenderId,
      'lastMessageStatus': _$MessageStatusEnumMap[instance.lastMessageStatus]!,
      'type': _$ConversationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'pinnedBy': instance.pinnedBy,
      'unreadCount': instance.unreadCount,
      'typing': instance.typing,
      'participantsLastRead': instance.participantsLastRead.map(
        (k, e) => MapEntry(k, e.toIso8601String()),
      ),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
};

const _$ConversationTypeEnumMap = {
  ConversationType.direct: 'direct',
  ConversationType.group: 'group',
};
