import 'package:caffchat/domain/entities/user/user_profile.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_uid_provider.g.dart';

@riverpod
Stream<UserProfile?> userProfileByUid(
  Ref ref,
  String uid,
) {
  final profileRepo = ref.watch(
    userProfileRepositoryProvider,
  );
  return profileRepo.watchProfile(uid);
}
