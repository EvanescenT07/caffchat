import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    final subscription = FirebaseAuth
        .instance
        .authStateChanges()
        .listen((user) {
          state = user != null;
        });

    ref.onDispose(subscription.cancel);

    return FirebaseAuth
            .instance
            .currentUser !=
        null;
  }
}
