import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/router/app_route_name.dart';
import 'package:caffchat/domain/entities/chat/chat_conversation.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/presentation/pages/chat/widgets/conversation_tile.dart';
import 'package:caffchat/presentation/pages/chat/widgets/new_chat_dialog.dart';
import 'package:caffchat/presentation/pages/chat/widgets/pinned_chat_card.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/chat/conversation_list_provider.dart';
import 'package:caffchat/presentation/providers/chat/user_profile_uid_provider.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatListPage
    extends HookConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final conversationAsync = ref.watch(
      conversationListProvider,
    );
    final authRepo = ref.watch(
      authRepositoryProvider,
    );
    final currentUserId =
        authRepo.currentUser?.uid ?? '';

    return Scaffold(
      backgroundColor:
          context.colors.surface,
      appBar: AppBar(
        backgroundColor:
            context.colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.chat_bubble_outline,
              color: context
                  .colors
                  .primaryContainer,
              size: 28,
            ),
            const SizedBox(
              width: CaffSpacing.md,
            ),
            CaffText(
              text: 'CaffChat',
              size:
                  CaffFontSize.titleLg,
              weight:
                  CaffFontWeight.bold,
              color: context
                  .colors
                  .onSurface,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: context
                  .colors
                  .onSurface,
            ),
            // TODO: [BACKEND_REQUIRED] Implement search
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Search feature coming soon',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: conversationAsync.when(
        data: (conversations) {
          if (conversations.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_outlined,
                    size: 64,
                    color: context
                        .colors
                        .outlineVariant,
                  ),
                  const SizedBox(
                    height:
                        CaffSpacing.md,
                  ),
                  CaffText(
                    text:
                        'No Conversation yet',
                    size: CaffFontSize
                        .bodyLg,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                  const SizedBox(
                    height:
                        CaffSpacing.md,
                  ),
                  CaffText(
                    text:
                        'Start a new chat!',
                    size: CaffFontSize
                        .bodyMd,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ],
              ),
            );
          }
          final pinned = conversations
              .where(
                (c) =>
                    c.pinnedBy.contains(
                      currentUserId,
                    ),
              )
              .toList();
          final unpinned = conversations
              .where(
                (c) => !c.pinnedBy
                    .contains(
                      currentUserId,
                    ),
              )
              .toList();
          return ListView(
            children: [
              // Pinned section
              if (pinned
                  .isNotEmpty) ...[
                Padding(
                  padding:
                      const EdgeInsets.only(
                        left:
                            CaffSpacing
                                .md,
                        top: CaffSpacing
                            .sm,
                        bottom:
                            CaffSpacing
                                .sm,
                      ),
                  child: CaffText(
                    text:
                        'Pinned Chats',
                    size: CaffFontSize
                        .labelSm,
                    weight:
                        CaffFontWeight
                            .semiBold,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection:
                        Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal:
                              CaffSpacing
                                  .md,
                        ),
                    itemCount:
                        pinned.length,
                    separatorBuilder:
                        (
                          _,
                          _,
                        ) => const SizedBox(
                          width:
                              CaffSpacing
                                  .sm,
                        ),
                    itemBuilder: (context, index) {
                      final conv =
                          pinned[index];
                      return PinnedChatCard(
                        name:
                            conv.title ??
                            conv.id
                                .substring(
                                  0,
                                  6,
                                ),
                        unreadCount:
                            conv.unreadCount[currentUserId] ??
                            0,
                        onTap: () =>
                            _navigateToChat(
                              context,
                              conv.id,
                            ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height:
                      CaffSpacing.md,
                ),
              ],
              // Conversation List
              ...unpinned.map(
                (conv) =>
                    _buildConversationTile(
                      context,
                      conv,
                      currentUserId,
                    ),
              ),
              // Pinned in the main list
              ...pinned.map(
                (conv) =>
                    _buildConversationTile(
                      context,
                      conv,
                      currentUserId,
                    ),
              ),
            ],
          );
        },

        // TODO: Changes into skeleton loader
        loading: () => const Center(
          child:
              CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: CaffText(
            text:
                'Failed to load conversation',
            color: context.colors.error,
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
            backgroundColor: context
                .colors
                .primaryContainer,
            foregroundColor: context
                .colors
                .onPrimaryContainer,
            onPressed: () =>
                _showNewChatDialog(
                  context,
                  ref,
                  currentUserId,
                ),
            child: const Icon(
              Icons.chat,
            ),
          ),
    );
  }

  void _navigateToChat(
    BuildContext context,
    String conversationId,
  ) {
    context.pushNamed(
      RouteName.chatRoom,
      pathParameters: {
        'conversationId':
            conversationId,
      },
    );
  }

  Widget _buildConversationTile(
    BuildContext context,
    ChatConversation conv,
    String currentUserId,
  ) {
    return _ResolvedConversationTile(
      conversation: conv,
      currentUserId: currentUserId,
      onTap: () => _navigateToChat(
        context,
        conv.id,
      ),
    );
  }

  void _showNewChatDialog(
    BuildContext context,
    WidgetRef ref,
    String currentUserId,
  ) {
    // Fetch current user's phone for self-chat prevention
    final profileRepo = ref.read(
      userProfileRepositoryProvider,
    );
    profileRepo
        .getProfile(currentUserId)
        .then((result) {
          if (!context.mounted) return;
          final currentUserPhone =
              result is Success
              ? result
                    .resultValue
                    ?.phoneNumber
              : null;

          showDialog(
            context: context,
            builder: (_) => NewChatDialog(
              currentUserId:
                  currentUserId,
              currentUserPhone:
                  currentUserPhone,
              onChatCreated:
                  (conversationId) =>
                      _navigateToChat(
                        context,
                        conversationId,
                      ),
            ),
          );
        });
  }
}

class _ResolvedConversationTile
    extends ConsumerWidget {
  final ChatConversation conversation;
  final String currentUserId;
  final VoidCallback onTap;

  const _ResolvedConversationTile({
    required this.conversation,
    required this.currentUserId,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // Find other participant's UID
    final otherUserId = conversation
        .participants
        .firstWhere(
          (uid) => uid != currentUserId,
          orElse: () => '',
        );

    // Watch their profile for name + online status
    final otherUserAsync = ref.watch(
      userProfileByUidProvider(
        otherUserId,
      ),
    );

    final displayName =
        otherUserAsync.whenOrNull(
          data: (profile) =>
              profile?.displayName,
        ) ??
        conversation.title ??
        conversation.id.substring(0, 8);

    final isOnline =
        otherUserAsync.whenOrNull(
          data: (profile) =>
              profile?.isOnline ??
              false,
        ) ??
        false;

    final isTyping = conversation
        .typing
        .entries
        .where(
          (e) => e.key != currentUserId,
        )
        .any((e) => e.value);

    final isLastMessageFromMe =
        conversation
            .lastMessageSenderId ==
        currentUserId;

    return ConversationTile(
      title: displayName,
      lastMessage:
          conversation.lastMessage,
      lastMessageTime:
          conversation.lastMessageTime,
      unreadCount:
          conversation
              .unreadCount[currentUserId] ??
          0,
      isOnline: isOnline,
      isTyping: isTyping,
      lastMessageStatus: conversation
          .lastMessageStatus,
      conversationType:
          conversation.type,
      isLastMessageFromMe:
          isLastMessageFromMe,
      onTap: onTap,
    );
  }
}
