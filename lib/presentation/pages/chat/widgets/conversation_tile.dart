import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/utils/timestamp_formatter.dart';
import 'package:caffchat/domain/entities/chat/conversation_type.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:caffchat/presentation/pages/chat/widgets/chat_avatar.dart';
import 'package:caffchat/presentation/pages/chat/widgets/unread_badge.dart';
import 'package:flutter/material.dart';

class ConversationTile
    extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String lastMessage;
  final DateTime? lastMessageTime;
  final int unreadCount;
  final bool isOnline;
  final bool isTyping;
  final MessageStatus lastMessageStatus;
  final ConversationType
  conversationType;
  final String? lastMessageSenderName;
  final bool isLastMessageFromMe;
  final VoidCallback? onTap;

  const ConversationTile({
    super.key,
    required this.title,
    this.imageUrl,
    this.lastMessage = '',
    this.lastMessageTime,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isTyping = false,
    this.lastMessageStatus =
        MessageStatus.sent,
    this.conversationType =
        ConversationType.direct,
    this.lastMessageSenderName,
    this.isLastMessageFromMe = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 10,
            ),
        child: Row(
          children: [
            // Avatar
            ChatAvatar(
              name: title,
              imageUrl: imageUrl,
              radius: 26,
              showOnlineIndicator: true,
              isOnline: isOnline,
            ),
            const SizedBox(
              width: CaffSpacing.md,
            ),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  // Title and Time row
                  Row(
                    children: [
                      Expanded(
                        child: CaffText(
                          text: title,
                          size: CaffFontSize
                              .bodyLg,
                          weight: CaffFontWeight
                              .semiBold,
                          maxLines: 1,
                          overflow:
                              TextOverflow
                                  .ellipsis,
                        ),
                      ),
                      if (lastMessageTime !=
                          null)
                        CaffText(
                          text: lastMessageTime!
                              .toChatTimestamp(),
                          size: CaffFontSize
                              .labelSm,
                          color:
                              unreadCount >
                                  0
                              ? const Color(
                                  0xFF25D366,
                                )
                              : context
                                    .colors
                                    .onSurfaceVariant,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),

                  // Last Message and Badge Row
                  Row(
                    children: [
                      _buildStatusIcon(
                        context.colors,
                      ),
                      Expanded(
                        child: isTyping
                            ? CaffText(
                                text:
                                    'typing...',
                                size: CaffFontSize
                                    .bodyMd,
                                color: const Color(
                                  0xFF25D366,
                                ),
                                isItalic:
                                    true,
                              )
                            : CaffText(
                                text:
                                    _buildSubtitle(),
                                size: CaffFontSize
                                    .bodyMd,
                                color: context
                                    .colors
                                    .onSurfaceVariant,
                                maxLines:
                                    1,
                                overflow:
                                    TextOverflow.ellipsis,
                              ),
                      ),
                      if (unreadCount >
                          0)
                        Padding(
                          padding: const EdgeInsets.only(
                            left:
                                CaffSpacing
                                    .md,
                          ),
                          child: UnreadBadge(
                            count:
                                unreadCount,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(
    CaffColor colors,
  ) {
    if (!isLastMessageFromMe) {
      return const SizedBox.shrink();
    }
    final Color iconColor;
    final IconData icon;

    switch (lastMessageStatus) {
      case MessageStatus.sending:
        iconColor =
            colors.onSurfaceVariant;
        icon = Icons.access_time;
      case MessageStatus.sent:
        iconColor =
            colors.onSurfaceVariant;
        icon = Icons.check;
      case MessageStatus.delivered:
        iconColor =
            colors.onSurfaceVariant;
        icon = Icons.done_all;
      case MessageStatus.read:
        iconColor = const Color(
          0xFF53BDEB,
        );
        icon = Icons.done_all;
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: 4,
      ),
      child: Icon(
        icon,
        size: 16,
        color: iconColor,
      ),
    );
  }

  String _buildSubtitle() {
    if (conversationType ==
            ConversationType.group &&
        lastMessageSenderName != null) {
      return '$lastMessageSenderName: $lastMessage';
    }
    return lastMessage;
  }
}
