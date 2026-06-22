import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/presentation/providers/chat/chat_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_message_provider.g.dart';

@riverpod
Stream<List<ChatMessage>> chatMessages(
  Ref ref,
  String conversationId,
) {
  final chatRepo = ref.watch(chatRepositoryProvider);
  return chatRepo.watchMessages(conversationId);
}
