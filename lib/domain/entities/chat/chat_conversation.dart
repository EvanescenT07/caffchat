import 'package:caffchat/domain/entities/chat/conversation_type.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_conversation.freezed.dart';
part 'chat_conversation.g.dart';

@freezed
abstract class ChatConversation
    with _$ChatConversation {
  const factory ChatConversation({
    required String id,
    required List<String> participants,
    @Default('') String lastMessage,
    DateTime? lastMessageTime,
    String? lastMessageSenderId,
    @Default(MessageStatus.sent)
    MessageStatus lastMessageStatus,
    @Default(ConversationType.direct)
    ConversationType type,
    String? title,
    @Default([]) List<String> pinnedBy,
    @Default({})
    Map<String, int> unreadCount,
    @Default({})
    Map<String, bool> typing,
    @Default({})
    Map<String, DateTime>
    participantsLastRead,
    DateTime? createdAt,
  }) = _ChatConversation;

  factory ChatConversation.fromJson(
    Map<String, dynamic> json,
  ) => _$ChatConversationFromJson(json);
}
