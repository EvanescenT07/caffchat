import 'package:caffchat/domain/entities/user/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;
  final String? bio;
  final String? phoneNumber;
  final bool isOnline;
  final DateTime? lastSeen;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserProfileModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.bio,
    this.phoneNumber,
    this.isOnline = false,
    this.lastSeen,
    this.createdAt,
    this.updatedAt,
  });

  // Deserializes a Firestore document snapshot into a model
  factory UserProfileModel.fromFirestore(
    DocumentSnapshot<
      Map<String, dynamic>
    >
    doc,
  ) {
    final data = doc.data()!;
    return UserProfileModel(
      uid: doc.id,
      email: data['email'] as String,
      displayName:
          data['displayName'] as String,
      photoUrl:
          data['photoUrl'] as String?,
      bio: data['bio'] as String?,
      phoneNumber:
          data['phoneNumber']
              as String?,
      isOnline:
          data['isOnline'] as bool? ??
          false,
      lastSeen:
          (data['lastSeen']
                  as Timestamp?)
              ?.toDate(),
      createdAt:
          (data['createdAt']
                  as Timestamp?)
              ?.toDate(),
      updatedAt:
          (data['updatedAt']
                  as Timestamp?)
              ?.toDate(),
    );
  }

  // Seralizes to Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'lastSeen': lastSeen != null
          ? Timestamp.fromDate(
              lastSeen!,
            )
          : null,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(
              createdAt!,
            )
          : FieldValue.serverTimestamp(),
      'updatedAt':
          FieldValue.serverTimestamp(),
    };
  }

  // Convert to domain entity
  UserProfile toEntity() {
    return UserProfile(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      bio: bio,
      phoneNumber: phoneNumber,
      isOnline: isOnline,
      lastSeen: lastSeen,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // Create a model from a domain entity
  factory UserProfileModel.fromEntity(
    UserProfile entity,
  ) {
    return UserProfileModel(
      uid: entity.uid,
      email: entity.email,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      bio: entity.bio,
      phoneNumber: entity.phoneNumber,
      isOnline: entity.isOnline,
      lastSeen: entity.lastSeen,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
