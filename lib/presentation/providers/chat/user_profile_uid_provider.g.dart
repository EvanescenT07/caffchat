// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_uid_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileByUidHash() => r'a24145b570919b9a8d0898faafe571ff213fce4e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userProfileByUid].
@ProviderFor(userProfileByUid)
const userProfileByUidProvider = UserProfileByUidFamily();

/// See also [userProfileByUid].
class UserProfileByUidFamily extends Family<AsyncValue<UserProfile?>> {
  /// See also [userProfileByUid].
  const UserProfileByUidFamily();

  /// See also [userProfileByUid].
  UserProfileByUidProvider call(String uid) {
    return UserProfileByUidProvider(uid);
  }

  @override
  UserProfileByUidProvider getProviderOverride(
    covariant UserProfileByUidProvider provider,
  ) {
    return call(provider.uid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProfileByUidProvider';
}

/// See also [userProfileByUid].
class UserProfileByUidProvider extends AutoDisposeStreamProvider<UserProfile?> {
  /// See also [userProfileByUid].
  UserProfileByUidProvider(String uid)
    : this._internal(
        (ref) => userProfileByUid(ref as UserProfileByUidRef, uid),
        from: userProfileByUidProvider,
        name: r'userProfileByUidProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userProfileByUidHash,
        dependencies: UserProfileByUidFamily._dependencies,
        allTransitiveDependencies:
            UserProfileByUidFamily._allTransitiveDependencies,
        uid: uid,
      );

  UserProfileByUidProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    Stream<UserProfile?> Function(UserProfileByUidRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProfileByUidProvider._internal(
        (ref) => create(ref as UserProfileByUidRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserProfile?> createElement() {
    return _UserProfileByUidProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileByUidProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProfileByUidRef on AutoDisposeStreamProviderRef<UserProfile?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _UserProfileByUidProviderElement
    extends AutoDisposeStreamProviderElement<UserProfile?>
    with UserProfileByUidRef {
  _UserProfileByUidProviderElement(super.provider);

  @override
  String get uid => (origin as UserProfileByUidProvider).uid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
