import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class ChatAvatar
    extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final double radius;
  final bool showOnlineIndicator;
  final bool isOnline;

  const ChatAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 24,
    this.showOnlineIndicator = false,
    this.isOnline = false,
  });

  String get _initials {
    final parts = name.trim().split(
      ' ',
    );
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'
          .toUpperCase();
    }
    return name.isNotEmpty
        ? name[0].toUpperCase()
        : '?';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: context
                .colors
                .primaryContainer,
            backgroundImage:
                imageUrl != null &&
                    imageUrl!.isNotEmpty
                ? NetworkImage(
                    imageUrl!,
                  )
                : null,
            child:
                imageUrl == null ||
                    imageUrl!.isEmpty
                ? Text(
                    _initials,
                    style: TextStyle(
                      fontSize:
                          radius * 0.7,
                      fontWeight:
                          CaffFontWeight
                              .semiBold
                              .value,
                      color: context
                          .colors
                          .onPrimaryContainer,
                    ),
                  )
                : null,
          ),
          if (showOnlineIndicator &&
              isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: radius * 0.5,
                height: radius * 0.5,
                decoration:
                    BoxDecoration(
                      color: context
                          .colors
                          .secondary,
                      shape: BoxShape
                          .circle,
                      border: Border.all(
                        color: context
                            .colors
                            .surface,
                        width: 2,
                      ),
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
