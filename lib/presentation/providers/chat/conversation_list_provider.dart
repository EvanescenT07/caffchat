import 'package:caffchat/domain/entities/chat/chat_conversation.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/chat/chat_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversation_list_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<ChatConversation>>
conversationList(Ref ref) {
  final authRepo = ref.watch(
    authRepositoryProvider,
  );
  final currentUser =
      authRepo.currentUser;
  if (currentUser == null) {
    return Stream.value([]);
  }
  final chatRepo = ref.watch(
    chatRepositoryProvider,
  );
  return chatRepo.watchConversations(
    currentUser.uid,
  );
}
