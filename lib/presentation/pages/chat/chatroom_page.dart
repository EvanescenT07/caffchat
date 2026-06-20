import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/domain/entities/chat/chat_message.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/presentation/pages/chat/widgets/chatroom_app_bar.dart';
import 'package:caffchat/presentation/pages/chat/widgets/date_separator.dart';
import 'package:caffchat/presentation/pages/chat/widgets/message_bubble.dart';
import 'package:caffchat/presentation/pages/chat/widgets/message_input_bar.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/chat/chat_message_provider.dart';
import 'package:caffchat/presentation/providers/chat/chat_repository_provider.dart';
import 'package:caffchat/presentation/providers/chat/send_message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomPage
    extends HookConsumerWidget {
  final String conversationId;

  const ChatRoomPage({
    super.key,
    required this.conversationId,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final messageController =
        useTextEditingController();
    final scrollController =
        useScrollController();
    final messageAsync = ref.watch(
      chatMessagesProvider(
        conversationId,
      ),
    );
    final authRepo = ref.watch(
      authRepositoryProvider,
    );
    final currentUserId =
        authRepo.currentUser?.uid ?? '';
    final sendState = ref.watch(
      sendMessageProvider,
    );
    final isSending =
        sendState is AsyncLoading;

    // Mark as read when entering the chat
    ref.listen(
      chatMessagesProvider(
        conversationId,
      ),
      (prev, next) {
        if (next.hasValue) {
          ref
              .read(
                chatRepositoryProvider,
              )
              .markAsRead(
                conversationId:
                    conversationId,
                userId: currentUserId,
              );
        }
      },
    );

    return Scaffold(
      // TODO: [BACKEND_REQUIRED] Resolve participant name
      // from UserProfileRepository for direct chats
      appBar: ChatroomAppBar(
        name: conversationId.substring(
          0,
          8,
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(
            child: messageAsync.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return Center(
                    child: CaffText(
                      text:
                          'No Messages Yet\n Say hello!',
                      size: CaffFontSize
                          .bodyLg,
                      color: context
                          .colors
                          .onSurfaceVariant,
                      align: TextAlign
                          .center,
                    ),
                  );
                }
                return ListView.builder(
                  controller:
                      scrollController,
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal:
                            CaffSpacing
                                .md,
                        vertical:
                            CaffSpacing
                                .sm,
                      ),
                  itemCount:
                      messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        messages[index];
                    final showDateSeperator =
                        _shouldShowDate(
                          messages,
                          index,
                        );
                    return Column(
                      children: [
                        if (showDateSeperator)
                          DateSeparator(
                            date: message
                                .createdAt,
                          ),
                        MessageBubble(
                          content: message
                              .content,
                          timestamp: message
                              .createdAt,
                          isOutgoing:
                              message
                                  .senderId ==
                              currentUserId,
                          status: message
                              .status,
                        ),
                      ],
                    );
                  },
                );
              },
              loading: () => const Center(
                child:
                    CircularProgressIndicator(),
              ),
              error: (error, stack) =>
                  Center(
                    child: CaffText(
                      text:
                          'Failed to load messages',
                      color: context
                          .colors
                          .error,
                    ),
                  ),
            ),
          ),

          // Input bar
          MessageInputBar(
            controller:
                messageController,
            isSending: isSending,
            onSend: () async {
              final text =
                  messageController.text
                      .trim();
              if (text.isEmpty) return;
              messageController.clear();
              final result = await ref
                  .read(
                    sendMessageProvider
                        .notifier,
                  )
                  .send(
                    conversationId:
                        conversationId,
                    content: text,
                  );
              if (result is Success &&
                  scrollController
                      .hasClients) {
                // Scroll to bottom after sending message
                Future.delayed(
                  const Duration(
                    milliseconds: 150,
                  ),
                  () {
                    scrollController.animateTo(
                      scrollController
                          .position
                          .maxScrollExtent,
                      duration:
                          const Duration(
                            milliseconds:
                                300,
                          ),
                      curve: Curves
                          .easeOut,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  bool _shouldShowDate(
    List<ChatMessage> messages,
    int index,
  ) {
    if (index == 0) return true;
    final current =
        messages[index].createdAt;
    final previous =
        messages[index - 1].createdAt;
    return current.year !=
            previous.year ||
        current.month !=
            previous.month ||
        current.day != previous.day;
  }
}
