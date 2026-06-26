import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/utils/timestamp_formatter.dart';
import 'package:caffchat/domain/entities/chat/message_status.dart';
import 'package:flutter/material.dart';

class MessageBubble
    extends StatelessWidget {
  final String content;
  final DateTime timestamp;
  final bool isOutgoing;
  final MessageStatus status;

  const MessageBubble({
    super.key,
    required this.content,
    required this.timestamp,
    required this.isOutgoing,
    this.status = MessageStatus.sent,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isOutgoing
        ? context
              .colors
              .chatBubbleOutgoing
        : context
              .colors
              .chatBubbleIncoming;

    final borderRadius =
        BorderRadius.only(
          topLeft:
              const Radius.circular(16),
          topRight:
              const Radius.circular(16),
          bottomLeft: Radius.circular(
            isOutgoing ? 16 : 4,
          ),
          bottomRight: Radius.circular(
            isOutgoing ? 4 : 16,
          ),
        );

    return Align(
      alignment: isOutgoing
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isOutgoing ? 64 : 0,
          right: isOutgoing ? 0 : 64,
          bottom: 4,
        ),
        padding:
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withValues(
                    alpha: 0.05,
                  ),
              blurRadius: 2,
              offset: const Offset(
                0,
                1,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end,
          children: [
            // Message content
            CaffText(
              text: content,
              size: CaffFontSize.bodyLg,
              color: context
                  .colors
                  .onSurface,
              align: TextAlign.start,
            ),
            const SizedBox(height: 4),
            // Timestamp + status
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                CaffText(
                  text: timestamp
                      .toMessageTimestamp(),
                  size: CaffFontSize
                      .labelSm,
                  color: context
                      .colors
                      .onSurfaceVariant,
                ),
                _buildStatusIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    if (!isOutgoing) {
      return const SizedBox.shrink();
    }

    final Color iconColor;
    final IconData icon;

    switch (status) {
      case MessageStatus.sending:
        iconColor = Colors.grey;
        icon = Icons.access_time;
      case MessageStatus.sent:
        iconColor = Colors.grey;
        icon = Icons.check;
      case MessageStatus.delivered:
        iconColor = Colors.grey;
        icon = Icons.done_all;
      case MessageStatus.read:
        iconColor = const Color(
          0xFF53BDEB,
        );
        icon = Icons.done_all;
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
      ),
      child: Icon(
        icon,
        size: 14,
        color: iconColor,
      ),
    );
  }
}
