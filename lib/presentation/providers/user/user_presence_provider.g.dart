// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_presence_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userPresence)
final userPresenceProvider = UserPresenceProvider._();

final class UserPresenceProvider
    extends
        $FunctionalProvider<
          UserPresenceService,
          UserPresenceService,
          UserPresenceService
        >
    with $Provider<UserPresenceService> {
  UserPresenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPresenceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPresenceHash();

  @$internal
  @override
  $ProviderElement<UserPresenceService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserPresenceService create(Ref ref) {
    return userPresence(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPresenceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPresenceService>(value),
    );
  }
}

String _$userPresenceHash() => r'96ff1f43b86fc0825fa0dad02b76c683b3bacac7';
