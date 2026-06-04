import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;
  User? get currentUser;

  // Sign in with email and password
  Future<Result<User>> signInWithEmail({
    required String email,
    required String password,
  });

  // Register a new account
  Future<Result<User>>
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
