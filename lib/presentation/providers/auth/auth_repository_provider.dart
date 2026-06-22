import 'package:caffchat/data/repositories/auth/firebase_auth_repository.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthRepository();
}
