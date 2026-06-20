import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/domain/entities/chat/message_type.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/chat/chat_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_message_provider.g.dart';

@riverpod
class SendMessage
    extends _$SendMessage {
  @override
  AsyncValue<ChatMessage?> build() {
    return const AsyncData(null);
  }

  Future<Result<ChatMessage>> send({
    required String conversationId,
    required String content,
    MessageType type = MessageType.text,
  }) async {
    final authRepo = ref.read(
      authRepositoryProvider,
    );
    final currentUser =
        authRepo.currentUser;

    if (currentUser == null) {
      return Result.failed(
        'User not authenticated',
      );
    }

    state = const AsyncLoading();

    final chatRepo = ref.read(
      chatRepositoryProvider,
    );
    final result = await chatRepo
        .sendMessage(
          conversationId:
              conversationId,
          senderId: currentUser.uid,
          content: content,
          type: type,
        );
    switch (result) {
      case Success(:final value):
        state = AsyncData(value);
      case Failed(:final message):
        state = AsyncError(
          message,
          StackTrace.current,
        );
      case Cancel(:final message):
        state = AsyncError(
          message,
          StackTrace.current,
        );
    }
    return result;
  }
}
