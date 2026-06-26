// Contract for chat data operation
import 'package:caffchat/domain/entities/chat/chat_conversation.dart';
import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/domain/entities/chat/message_type.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';

abstract class ChatRepository {
  // Watches all conversation the user participates
  Stream<List<ChatConversation>>
  watchConversations(String userId);

  // Watches all message in a conversation
  Stream<List<ChatMessage>>
  watchMessages(String conversationId);

  // Send a new message and update the parent conversation doc
  Future<Result<ChatMessage>>
  sendMessage({
    required String conversationId,
    required String senderId,
    required String content,
    required MessageType type,
  });

  // Reset unread count for a user in a conversation
  Future<Result<void>> markAsRead({
    required String conversationId,
    required String userId,
  });

  // Creates a new conversation or return existing conversation
  Future<Result<ChatConversation>>
  getOrCreateDirectConversation({
    required String currentUserId,
    required String otherUserId,
  });

  // TODO: [BACKEND_REQUIRED] pinConversation / unpinConversation
  // TODO: [BACKEND_REQUIRED] setTypingIndicator
  // TODO: [BACKEND_REQUIRED] deleteMessage
  // TODO: [BACKEND_REQUIRED] createGroupConversation
}
