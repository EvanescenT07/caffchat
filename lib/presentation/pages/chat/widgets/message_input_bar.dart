import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:flutter/material.dart';

class MessageInputBar
    extends StatelessWidget {
  final TextEditingController
  controller;
  final VoidCallback onSend;
  final bool isSending;

  const MessageInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.isSending = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
            horizontal: CaffSpacing.sm,
            vertical: CaffSpacing.sm,
          ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(
                  alpha: 0.05,
                ),
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Attachment button
            // TODO: [BACKEND_REQUIRED] Implement file picker
            IconButton(
              icon: Icon(
                Icons.add,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Attachments feature coming soon',
                    ),
                  ),
                );
              },
            ),

            // Text field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context
                      .colors
                      .surfaceContainerLow,
                  borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    // Emoji button
                    Icon(
                      Icons
                          .emoji_emotions_outlined,
                      color: context
                          .colors
                          .onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextField(
                        controller:
                            controller,
                        decoration: InputDecoration(
                          hintText:
                              'Type a message',
                          hintStyle: TextStyle(
                            color: context
                                .colors
                                .onSurfaceVariant,
                          ),
                          border:
                              InputBorder
                                  .none,
                          contentPadding:
                              const EdgeInsets.symmetric(
                                vertical:
                                    10,
                              ),
                          isDense: true,
                        ),
                        style: TextStyle(
                          color: context
                              .colors
                              .onSurface,
                        ),
                        textInputAction:
                            TextInputAction
                                .send,
                        onSubmitted:
                            (_) =>
                                onSend(),
                        maxLines: null,
                      ),
                    ),
                    // Clip icon
                    // TODO: [BACKEND_REQUIRED] Implement file picker
                    IconButton(
                      icon: Icon(
                        Icons
                            .attach_file,
                        color: context
                            .colors
                            .onSurfaceVariant,
                        size: 22,
                      ),
                      onPressed: null,
                      constraints:
                          const BoxConstraints(),
                      padding:
                          const EdgeInsets.all(
                            8,
                          ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              width: CaffSpacing.sm,
            ),

            // Send button
            Material(
              color: context
                  .colors
                  .primaryContainer,
              shape:
                  const CircleBorder(),
              child: InkWell(
                onTap: isSending
                    ? null
                    : onSend,
                customBorder:
                    const CircleBorder(),
                child: Container(
                  width: 44,
                  height: 44,
                  alignment:
                      Alignment.center,
                  child: isSending
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth:
                                2,
                            color: context
                                .colors
                                .onPrimaryContainer,
                          ),
                        )
                      : Icon(
                          Icons.send,
                          color: context
                              .colors
                              .onPrimaryContainer,
                          size: 20,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
