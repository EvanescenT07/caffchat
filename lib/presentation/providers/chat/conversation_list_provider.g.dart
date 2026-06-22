// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(conversationList)
final conversationListProvider = ConversationListProvider._();

final class ConversationListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChatConversation>>,
          List<ChatConversation>,
          Stream<List<ChatConversation>>
        >
    with
        $FutureModifier<List<ChatConversation>>,
        $StreamProvider<List<ChatConversation>> {
  ConversationListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationListHash();

  @$internal
  @override
  $StreamProviderElement<List<ChatConversation>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ChatConversation>> create(Ref ref) {
    return conversationList(ref);
  }
}

String _$conversationListHash() => r'aee4c739e93513e7ddadd9329125f765cf972207';
