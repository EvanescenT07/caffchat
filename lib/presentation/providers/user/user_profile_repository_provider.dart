import 'package:caffchat/data/repositories/user/firestore_user_profile_repository.dart';
import 'package:caffchat/domain/repositories/user/user_profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_repository_provider.g.dart';

@riverpod
UserProfileRepository
userProfileRepository(Ref ref) {
  return FirestoreUserProfileRepository();
}
