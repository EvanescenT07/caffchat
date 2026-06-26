import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  bool build() {
    final repository =
        ref.watch(authRepositoryProvider);

    final subscription =
        repository.authStateChanges.listen(
      (user) {
        state = user != null;
      },
    );

    ref.onDispose(subscription.cancel);

    return repository.currentUser != null;
  }
}
