import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';

class ChangePassword {
  final AuthRepository _repository;

  ChangePassword(this._repository);

  Future<Result<void>> call({
    required String currentPassword,
    required String newPassword,
  }) {
    return _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
