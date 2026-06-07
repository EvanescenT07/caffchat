import 'package:caffchat/domain/entitites/auth/auth_user.dart';
import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';

class Register {
  final AuthRepository _repository;

  const Register(this._repository);

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
    String? displayName,
  }) {
    return _repository
        .registerWithEmail(
          email: email,
          password: password,
          displayName: displayName,
        );
  }
}
