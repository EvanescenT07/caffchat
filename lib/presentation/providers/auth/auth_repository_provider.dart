
import 'package:caffchat/data/datasources/auth/firebase_auth.dart';
import 'package:caffchat/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return FirebaseAuthDataSource();
}
