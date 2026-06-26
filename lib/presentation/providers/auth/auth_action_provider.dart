import 'package:caffchat/core/utils/app_logger.dart';
import 'package:caffchat/core/utils/phone_normalizer.dart';
import 'package:caffchat/domain/entities/auth/auth_user.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/presentation/providers/auth/auth_usecase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:caffchat/domain/entities/user/user_profile.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';

part 'auth_action_provider.g.dart';

@riverpod
class AuthAction extends _$AuthAction {
  @override
  AsyncValue<void> build() =>
      const AsyncData(null);

  /// Maps a [Result] to the corresponding [AsyncValue] state.
  ///
  /// Centralizes the result-to-state mapping to avoid
  /// duplicating the switch block across every action method.
  void _handleResult(
    Result<dynamic> result,
  ) {
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

  Future<Result<AuthUser>> register({
    required String email,
    required String password,
    required String phoneNumber,
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
    if (!ref.mounted) {
      return Result.cancel(
        'Provider disposed',
      );
    }
    _handleResult(result);
    // Sync to Firestore on successful registration
    if (result is Success<AuthUser>) {
      final authUser = result.value;
      final profile = UserProfile(
        uid: authUser.uid,
        email: authUser.email ?? email,
        displayName:
            authUser.displayName ??
            displayName ??
            '',
        phoneNumber:
            PhoneNormalizer.normalize(
              phoneNumber,
            ),
        createdAt: DateTime.now(),
      );
      try {
        await ref
            .read(
              userProfileRepositoryProvider,
            )
            .upsertProfile(profile);
      } on FirebaseException catch (e) {
        AppLogger.error(
          'Profile sync failed after registration',
          error: e,
        );
      }
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
    if (!ref.mounted) {
      return Result.cancel(
        'Provider disposed',
      );
    }
    _handleResult(result);

    // Ensure Firestore profile exists (handles pre-migration users)
    if (result is Success<AuthUser>) {
      final authUser = result.value;
      final profileRepo = ref.read(
        userProfileRepositoryProvider,
      );
      final existingProfile =
          await profileRepo.getProfile(
            authUser.uid,
          );
      if (existingProfile.isFailed) {
        final profile = UserProfile(
          uid: authUser.uid,
          email:
              authUser.email ?? email,
          displayName:
              authUser.displayName ??
              '',
          createdAt: DateTime.now(),
        );
        try {
          await ref
              .read(
                userProfileRepositoryProvider,
              )
              .upsertProfile(profile);
        } on FirebaseException catch (
          e
        ) {
          AppLogger.error(
            'Profile sync failed after signin',
            error: e,
          );
        }
      }
    }

    return result;
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    final result = await ref
        .read(signOutUseCaseProvider)
        .call();
    if (!ref.mounted) return;
    _handleResult(result);
  }

    Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .read(changePasswordUseCaseProvider)
        .call(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
    if (!ref.mounted) return;
    _handleResult(result);
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
    if (!ref.mounted) return;
    _handleResult(result);
  }
}
