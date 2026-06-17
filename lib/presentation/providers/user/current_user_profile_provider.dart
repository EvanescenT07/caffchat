import 'package:caffchat/domain/entities/user/user_profile.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_profile_provider.g.dart';

@riverpod
Stream<UserProfile?> currentUserProfile(
  Ref ref,
) {
  final authRepo = ref.watch(
    authRepositoryProvider,
  );
  final currentUser =
      authRepo.currentUser;

  if (currentUser == null) {
    return Stream.value(null);
  }

  final profileRepo = ref.watch(
    userProfileRepositoryProvider,
  );
  return profileRepo.watchProfile(
    currentUser.uid,
  );
}
