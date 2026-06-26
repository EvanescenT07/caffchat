// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendMessage)
final sendMessageProvider = SendMessageProvider._();

final class SendMessageProvider
    extends $NotifierProvider<SendMessage, AsyncValue<ChatMessage?>> {
  SendMessageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendMessageHash();

  @$internal
  @override
  SendMessage create() => SendMessage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ChatMessage?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<ChatMessage?>>(value),
    );
  }
}

String _$sendMessageHash() => r'821d0e15a51dbe6852d1d20eced9eab2d219b9a2';

abstract class _$SendMessage extends $Notifier<AsyncValue<ChatMessage?>> {
  AsyncValue<ChatMessage?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ChatMessage?>, AsyncValue<ChatMessage?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatMessage?>, AsyncValue<ChatMessage?>>,
              AsyncValue<ChatMessage?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
