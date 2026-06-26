import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class UnreadBadge
    extends StatelessWidget {
  final int count;

  const UnreadBadge({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding:
          const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
      constraints: const BoxConstraints(
        minHeight: 20,
        minWidth: 20,
      ),
      decoration: BoxDecoration(
        color: context.colors.secondary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CaffText(
          text: count > 99
              ? '99+'
              : count.toString(),
          color: Colors.white,
          size: CaffFontSize.labelSm,
          weight:
              CaffFontWeight.semiBold,
        ),
      ),
    );
  }
}
