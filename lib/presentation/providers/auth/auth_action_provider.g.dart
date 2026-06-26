// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthAction)
final authActionProvider = AuthActionProvider._();

final class AuthActionProvider
    extends $NotifierProvider<AuthAction, AsyncValue<void>> {
  AuthActionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authActionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authActionHash();

  @$internal
  @override
  AuthAction create() => AuthAction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$authActionHash() => r'2b5901ac60289fdd11837987eeaa7b179f1fee5d';

abstract class _$AuthAction extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
