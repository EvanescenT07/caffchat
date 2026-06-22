// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_uid_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userProfileByUid)
final userProfileByUidProvider = UserProfileByUidFamily._();

final class UserProfileByUidProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserProfile?>,
          UserProfile?,
          Stream<UserProfile?>
        >
    with $FutureModifier<UserProfile?>, $StreamProvider<UserProfile?> {
  UserProfileByUidProvider._({
    required UserProfileByUidFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userProfileByUidProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userProfileByUidHash();

  @override
  String toString() {
    return r'userProfileByUidProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<UserProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserProfile?> create(Ref ref) {
    final argument = this.argument as String;
    return userProfileByUid(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileByUidProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userProfileByUidHash() => r'a24145b570919b9a8d0898faafe571ff213fce4e';

final class UserProfileByUidFamily extends $Family
    with $FunctionalFamilyOverride<Stream<UserProfile?>, String> {
  UserProfileByUidFamily._()
    : super(
        retry: null,
        name: r'userProfileByUidProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserProfileByUidProvider call(String uid) =>
      UserProfileByUidProvider._(argument: uid, from: this);

  @override
  String toString() => r'userProfileByUidProvider';
}
