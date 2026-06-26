import 'package:caffchat/domain/usecase/auth/change_password.dart';
import 'package:caffchat/domain/usecase/auth/forgot_password.dart';
import 'package:caffchat/domain/usecase/auth/register.dart';
import 'package:caffchat/domain/usecase/auth/sign_in.dart';
import 'package:caffchat/domain/usecase/auth/sign_out.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecase_provider.g.dart';

@riverpod
SignIn signInUseCase(Ref ref) {
  return SignIn(
    ref.watch(authRepositoryProvider),
  );
}

@riverpod
Register registerUseCase(Ref ref) {
  return Register(
    ref.watch(authRepositoryProvider),
  );
}

@riverpod
SignOut signOutUseCase(Ref ref) {
  return SignOut(
    ref.watch(authRepositoryProvider),
  );
}

@riverpod
ForgotPassword forgotPasswordUseCase(
  Ref ref,
) {
  return ForgotPassword(
    ref.watch(authRepositoryProvider),
  );
}

@riverpod
ChangePassword changePasswordUseCase(
  Ref ref,
) {
  return ChangePassword(
    ref.watch(authRepositoryProvider),
  );
}
