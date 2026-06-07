import 'package:caffchat/domain/entitites/auth/auth_user.dart';
import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/presentation/providers/auth/auth_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_action_provider.g.dart';

@riverpod
class AuthAction extends _$AuthAction {
  @override
  AsyncValue<void> build() =>
      const AsyncData(null);

  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(registerUseCaseProvider)
        .call(
          email: email,
          password: password,
          displayName: displayName,
        );

    switch (result) {
      case Success():
        state = const AsyncData(null);
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

  Future<Result<AuthUser>> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(signInUseCaseProvider)
        .call(
          email: email,
          password: password,
        );

    switch (result) {
      case Success():
        state = const AsyncData(null);
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

  Future<void> signOut() async {
    state = const AsyncLoading();
    final result = await ref
        .read(signOutUseCaseProvider)
        .call();

    switch (result) {
      case Success():
        state = const AsyncData(null);
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
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(
          forgotPasswordUseCaseProvider,
        )
        .call(email: email);
    switch (result) {
      case Success():
        state = const AsyncData(null);
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
  }
}
