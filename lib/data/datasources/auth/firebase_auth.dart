import 'package:caffchat/core/utils/app_logger.dart';
import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource
    implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth =
           firebaseAuth ??
           FirebaseAuth.instance;

  @override
  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();

  @override
  User? get currentUser =>
      _firebaseAuth.currentUser;

  @override
  Future<Result<User>> signInWithEmail({
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
          'Sign-in succeed but user is null',
        );
      }
      return Result.success(user);
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
  Future<Result<User>>
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
          'Register succeed but user is null',
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

      return Result.success(
        _firebaseAuth.currentUser ??
            user,
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

  // Maps Firebase error code
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
