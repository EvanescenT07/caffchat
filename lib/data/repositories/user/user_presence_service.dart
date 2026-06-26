import 'package:caffchat/core/utils/app_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPresenceService {
  final FirebaseFirestore _firestore;

  UserPresenceService({
    FirebaseFirestore? firestore,
  }) : _firestore =
           firestore ??
           FirebaseFirestore.instance;

  CollectionReference<
    Map<String, dynamic>
  >
  get _usersRef =>
      _firestore.collection('users');

  Future<void> setOnline(
    String uid,
  ) async {
    try {
      await _usersRef.doc(uid).update({
        'isOnline': true,
        'lastSeen':
            FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to set user online',
        error: e,
      );
    }
  }

  Future<void> setOffline(
    String uid,
  ) async {
    try {
      await _usersRef.doc(uid).update({
        'isOnline': false,
        'lastSeen':
            FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      AppLogger.error(
        'Failed to set user offline',
        error: e,
      );
    }
  }
}
