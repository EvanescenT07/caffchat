import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/presentation/pages/chat/widgets/chat_avatar.dart';
import 'package:flutter/material.dart';

class ChatroomAppBar
    extends StatelessWidget
    implements PreferredSizeWidget {
  final String name;
  final String? imageUrl;
  final bool isOnline;
  final DateTime? lastSeen;
  final VoidCallback? onBackPressed;

  const ChatroomAppBar({
    super.key,
    required this.name,
    this.imageUrl,
    this.isOnline = false,
    this.lastSeen,
    this.onBackPressed,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(
        kToolbarHeight,
      );

  String get _subtitle {
    if (isOnline) return 'Online';
    // TODO: [BACKEND_REQUIRED] Format lastSeen properly
    return 'Offline';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context
          .colors
          .primaryContainer,
      foregroundColor: context
          .colors
          .onPrimaryContainer,
      leadingWidth: 32,
      leading: IconButton(
        onPressed:
            onBackPressed ??
            () => Navigator.of(
              context,
            ).pop(),
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      title: Row(
        children: [
          ChatAvatar(
            name: name,
            imageUrl: imageUrl,
            radius: 20,
            showOnlineIndicator: false,
          ),
          const SizedBox(
            width: CaffSpacing.sm,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                CaffText(
                  text: name,
                  size: CaffFontSize
                      .bodyLg,
                  weight: CaffFontWeight
                      .semiBold,
                  color: context
                      .colors
                      .onPrimaryContainer,
                  maxLines: 1,
                  overflow: TextOverflow
                      .ellipsis,
                ),
                CaffText(
                  text: _subtitle,
                  size: CaffFontSize
                      .labelSm,
                  color: isOnline
                      ? const Color(
                          0xFF4CAF50,
                        )
                      : context
                            .colors
                            .onPrimaryContainer
                            .withValues(
                              alpha:
                                  0.7,
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // TODO: [BACKEND_REQUIRED] Implement video call
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              const SnackBar(
                content: CaffText(
                  text:
                      'Video Call Feature Coming Soon',
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.videocam,
          ),
        ),
        const SizedBox(
          width: CaffSpacing.xs,
        ),
        // TODO: [BACKEND_REQUIRED] Implement video call
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              const SnackBar(
                content: CaffText(
                  text:
                      'Voice Call Feature Coming Soon',
                ),
              ),
            );
          },
          icon: const Icon(Icons.call),
        ),
        const SizedBox(
          width: CaffSpacing.xs,
        ),

        // More options
        PopupMenuButton<String>(
          onSelected: (value) {
            // TODO: Handle menu actions
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Clear Chat',
              child: CaffText(
                text: 'Clear Chat',
              ),
            ),
            const PopupMenuItem(
              value: 'mute',
              child: CaffText(
                text:
                    'Mute Notification',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
