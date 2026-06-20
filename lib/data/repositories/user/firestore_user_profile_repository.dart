import 'package:caffchat/core/utils/app_logger.dart';
import 'package:caffchat/data/models/user/user_profile_model.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/domain/entities/user/user_profile.dart';
import 'package:caffchat/domain/repositories/user/user_profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserProfileRepository
    implements UserProfileRepository {
  final FirebaseFirestore _firestore;

  FirestoreUserProfileRepository({
    FirebaseFirestore? firestore,
  }) : _firestore =
           firestore ??
           FirebaseFirestore.instance;

  CollectionReference<
    Map<String, dynamic>
  >
  get _usersCollection =>
      _firestore.collection('users');

  @override
  Future<Result<UserProfile>>
  upsertProfile(
    UserProfile profile,
  ) async {
    try {
      final model =
          UserProfileModel.fromEntity(
            profile,
          );
      await _usersCollection
          .doc(profile.uid)
          .set(
            model.toFirestore(),
            SetOptions(merge: true),
          );
      return Result.success(profile);
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to upsert user profile',
        error: e,
      );
      return Result.failed(
        'Failed to save profile : ${e.message}',
      );
    }
  }

  @override
  Future<Result<UserProfile>>
  getProfile(String uid) async {
    try {
      final doc = await _usersCollection
          .doc(uid)
          .get();
      if (!doc.exists ||
          doc.data() == null) {
        return Result.failed(
          'User Profile not found',
        );
      }
      final model =
          UserProfileModel.fromFirestore(
            doc,
          );
      return Result.success(
        model.toEntity(),
      );
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to fetch user profile',
        error: e,
      );
      return Result.failed(
        'Failed to load profile: ${e.message}',
      );
    }
  }

  @override
  Stream<UserProfile?> watchProfile(
    String uid,
  ) {
    return _usersCollection
        .doc(uid)
        .snapshots()
        .map((doc) {
          if (!doc.exists ||
              doc.data() == null) {
            return null;
          }
          return UserProfileModel.fromFirestore(
            doc,
          ).toEntity();
        });
  }

  @override
  Future<Result<UserProfile>>
  updateProfile({
    required String uid,
    String? displayName,
    String? photoUrl,
    String? bio,
    String? phoneNumber,
  }) async {
    try {
      final updates = <String, dynamic>{
        'updatedAt':
            FieldValue.serverTimestamp(),
      };
      if (displayName != null) {
        updates['displayName'] =
            displayName;
      }
      if (photoUrl != null) {
        updates['photoUrl'] = photoUrl;
      }
      if (bio != null) {
        updates['bio'] = bio;
      }
      if (phoneNumber != null) {
        updates['phoneNumber'] =
            phoneNumber;
      }

      await _usersCollection
          .doc(uid)
          .update(updates);
      return getProfile(uid);
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to update user profile',
        error: e,
      );
      return Result.failed(
        'Failed to update profile: ${e.message}',
      );
    }
  }
}
