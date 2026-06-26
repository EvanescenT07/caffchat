import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class ProfileHeader
    extends StatelessWidget {
  final String displayName;
  final String email;
  final VoidCallback onTap;

  const ProfileHeader({
    super.key,
    required this.displayName,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(
              horizontal:
                  CaffSpacing.lg,
              vertical: CaffSpacing.md,
            ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: context
                  .colors
                  .surfaceContainerHigh,
              child: Icon(
                Icons.person,
                size: 32,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
            ),

            const SizedBox(
              width: CaffSpacing.md,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  CaffText(
                    text:
                        displayName
                            .isNotEmpty
                        ? displayName
                        : 'User',
                    size: CaffFontSize
                        .labelSm,
                    weight:
                        CaffFontWeight
                            .semiBold,
                    color: context
                        .colors
                        .onSurface,
                  ),

                  const SizedBox(
                    height: 2,
                  ),
                  CaffText(
                    text: email,
                    size: CaffFontSize
                        .labelSm,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context
                  .colors
                  .onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
