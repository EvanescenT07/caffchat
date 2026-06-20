import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';

class ForgotPassword {
  final AuthRepository _repository;

  const ForgotPassword(
    this._repository,
  );

  Future<Result<void>> call({
    required String email,
  }) {
    return _repository
        .sendPasswordResetEmail(
          email: email,
        );
  }
}
