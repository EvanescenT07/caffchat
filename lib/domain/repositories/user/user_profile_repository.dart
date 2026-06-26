import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/entities/user/user_profile.dart';

abstract class UserProfileRepository {
  // Create or Update user profile document
  Future<Result<UserProfile>>
  upsertProfile(UserProfile profile);

  // Fetch the profile for a given UID
  Future<Result<UserProfile>>
  getProfile(String uid);

  // Stream real-time profile changes for a given UID
  Stream<UserProfile?> watchProfile(
    String uid,
  );

  // Update specific field on an existing profile
  Future<Result<UserProfile>>
  updateProfile({
    required String uid,
    String? displayName,
    String? photoUrl,
    String? bio,
    String? phoneNumber,
    bool? discoverableByPhone,
  });

  // Find User by phone number for new chat
  Future<Result<UserProfile>>
  findByPhoneNumber(String phoneNumber);
}
