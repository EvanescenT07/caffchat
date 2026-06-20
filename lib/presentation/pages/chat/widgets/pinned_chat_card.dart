import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_radius.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/presentation/pages/chat/widgets/chat_avatar.dart';
import 'package:caffchat/presentation/pages/chat/widgets/unread_badge.dart';
import 'package:flutter/material.dart';

class PinnedChatCard
    extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final int unreadCount;
  final bool isOnline;
  final VoidCallback? onTap;

  const PinnedChatCard({
    super.key,
    required this.name,
    this.imageUrl,
    this.unreadCount = 0,
    this.isOnline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding:
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
        decoration: BoxDecoration(
          color: context
              .colors
              .surfaceContainerLowest,
          borderRadius:
              CaffRadius.lgAll,
          border: Border.all(
            color: context
                .colors
                .outlineVariant
                .withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ChatAvatar(
                  name: name,
                  imageUrl: imageUrl,
                  radius: 24,
                  showOnlineIndicator:
                      true,
                  isOnline: isOnline,
                ),
                if (unreadCount > 0)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: UnreadBadge(
                      count:
                          unreadCount,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: CaffSpacing.xs,
            ),
            CaffText(
              text: name,
              size:
                  CaffFontSize.labelSm,
              weight:
                  CaffFontWeight.medium,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
