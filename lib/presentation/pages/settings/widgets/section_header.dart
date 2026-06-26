import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class SectionHeader
    extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CaffSpacing.lg,
        top: CaffSpacing.md,
        bottom: CaffSpacing.sm,
      ),
      child: CaffText(
        text: title.toUpperCase(),
        size: CaffFontSize.labelSm,
        weight: CaffFontWeight.semiBold,
        color: context
            .colors
            .onSurfaceVariant,
      ),
    );
  }
}

