import 'package:caffchat/domain/entities/auth/auth_user.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';

class SignIn {
  final AuthRepository _repository;

  const SignIn(this._repository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
  }) {
    return _repository.signInWithEmail(
      email: email,
      password: password,
    );
  }
}
