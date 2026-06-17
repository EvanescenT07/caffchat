import 'package:caffchat/domain/entities/auth/auth_user.dart';
import 'package:caffchat/domain/entities/result/result.dart';

abstract class AuthRepository {
  Stream<AuthUser?>
  get authStateChanges;
  AuthUser? get currentUser;

  // Validate the current user session
  Future<bool> validateSession();

  // Sign in with email and password
  Future<Result<AuthUser>>
  signInWithEmail({
    required String email,
    required String password,
  });

  // Register a new account
  Future<Result<AuthUser>>
  registerWithEmail({
    required String email,
    required String password,
    String? displayName,
  });

  // Sign out
  Future<Result<void>> signOut();

  // Send password reset email
  Future<Result<void>>
  sendPasswordResetEmail({
    required String email,
  });
}
