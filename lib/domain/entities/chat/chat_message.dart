import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:caffchat/domain/entities/chat/message_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage
    with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String conversationId,
    required String senderId,
    required String content,
    @Default(MessageType.text)
    MessageType type,
    @Default(MessageStatus.sent)
    MessageStatus status,
    required DateTime createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(
    Map<String, dynamic> json,
  ) => _$ChatMessageFromJson(json);
}
