import 'package:caffchat/core/utils/app_logger.dart';
import 'package:caffchat/domain/entities/auth/auth_user.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Repository implementation backed by Firebase Authentication.
///
/// Handles all Firebase Auth SDK interactions and maps
/// Firebase-specific types to domain entities.
class FirebaseAuthRepository
    implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth =
           firebaseAuth ??
           FirebaseAuth.instance;

  /// Maps Firebase [User] to domain [AuthUser] entity.
  AuthUser _mapToAuthUser(User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      isEmailVerified:
          user.emailVerified,
    );
  }

  @override
  Future<bool> validateSession() async {
    final user =
        _firebaseAuth.currentUser;
    if (user == null) return false;

    try {
      await user.reload();
      return _firebaseAuth
              .currentUser !=
          null;
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Session validate failed',
        error: e,
      );
      await _firebaseAuth.signOut();
      return false;
    }
  }

  @override
  Stream<AuthUser?>
  get authStateChanges => _firebaseAuth
      .authStateChanges()
      .map(
        (user) => user != null
            ? _mapToAuthUser(user)
            : null,
      );

  @override
  AuthUser? get currentUser {
    final user =
        _firebaseAuth.currentUser;
    return user != null
        ? _mapToAuthUser(user)
        : null;
  }

  @override
  Future<Result<AuthUser>>
  signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await _firebaseAuth
              .signInWithEmailAndPassword(
                email: email,
                password: password,
              );

      final user = credential.user;
      if (user == null) {
        return Result.failed(
          'Sign-in succeeded but user is null',
        );
      }
      return Result.success(
        _mapToAuthUser(user),
      );
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Sign-in failed',
        error: e,
      );
      return Result.failed(
        _mapAuthErrorToMessage(e.code),
      );
    }
  }

  @override
  Future<Result<AuthUser>>
  registerWithEmail({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      final user = credential.user;
      if (user == null) {
        return Result.failed(
          'Register succeeded but user is null',
        );
      }

      if (displayName != null &&
          displayName
              .trim()
              .isNotEmpty) {
        await user.updateDisplayName(
          displayName.trim(),
        );
        await user.reload();
      }

      final updatedUser =
          _firebaseAuth.currentUser ??
          user;
      return Result.success(
        _mapToAuthUser(updatedUser),
      );
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Register failed',
        error: e,
      );
      return Result.failed(
        _mapAuthErrorToMessage(e.code),
      );
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return Result.success(null);
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Sign-out failed',
        error: e,
      );
      return Result.failed(
        _mapAuthErrorToMessage(e.code),
      );
    }
  }

  @override
  Future<Result<void>>
  sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(
            email: email,
          );
      return Result.success(null);
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Password reset failed',
        error: e,
      );
      return Result.failed(
        _mapAuthErrorToMessage(e.code),
      );
    }
  }

  @override
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user =
          _firebaseAuth.currentUser;
      if (user == null ||
          user.email == null) {
        return Result.failed(
          'No authenticated user found',
        );
      }
      // Re-authenticate before password changes
      final credential =
          EmailAuthProvider.credential(
            email: user.email!,
            password: currentPassword,
          );
      await user
          .reauthenticateWithCredential(
            credential,
          );
      await user.updatePassword(
        newPassword,
      );
      return Result.success(null);
    } on FirebaseAuthException catch (
      e
    ) {
      AppLogger.error(
        'Password change failed',
        error: e,
      );
      return Result.failed(
        _mapAuthErrorToMessage(e.code),
      );
    }
  }

  /// Maps Firebase error codes to user-friendly messages.
  String _mapAuthErrorToMessage(
    String code,
  ) {
    return switch (code) {
      'user-not-found' =>
        'No account found with this email.',
      'wrong-password' =>
        'Incorrect password. Please try again.',
      'invalid-credential' =>
        'Invalid email or password.',
      'email-already-in-use' =>
        'An account already exists with this email.',
      'weak-password' =>
        'Password is too weak. Use at least 6 characters.',
      'invalid-email' =>
        'Please enter a valid email address.',
      'user-disabled' =>
        'This account has been disabled.',
      'too-many-requests' =>
        'Too many attempts. Please try again later.',
      'network-request-failed' =>
        'Network error. Check your connection.',
      _ =>
        'Authentication failed. Please try again.',
    };
  }
}
