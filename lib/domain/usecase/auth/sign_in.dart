import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  final AuthRepository _repository;

  const SignIn(this._repository);

  Future<Result<User>> call({
    required String email,
    required String password,
  }) {
    return _repository.signInWithEmail(
      email: email,
      password: password,
    );
  }
}
