import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_action_provider.g.dart';

@riverpod
class AuthAction extends _$AuthAction {
  @override
  AsyncValue<void> build() =>
      const AsyncData(null);

  Future<Result<User>> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(authRepositoryProvider)
        .registerWithEmail(
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

  Future<Result<User>> signIn({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(authRepositoryProvider)
        .signInWithEmail(
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
        .read(authRepositoryProvider)
        .signOut();

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
        .read(authRepositoryProvider)
        .sendPasswordResetEmail(
          email: email,
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
  }
}
