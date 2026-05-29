// Usage:
// CaffText(
//  text: 'Hello Word',
//  size: CaffFontSize.bodyLg,
//  weight: CaffFontWeight.semibold,
// )

import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class CaffText extends StatelessWidget {
  final String text;
  final CaffFontSize? size;
  final Color? color;
  final CaffFontWeight? weight;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool isItalic;
  final TextDecoration? decoration;
  final String? fontFamily;

  const CaffText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.align,
    this.maxLines,
    this.overflow,
    this.isItalic = false,
    this.decoration,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(
      context,
    ).colorScheme.onSurface;

    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color ?? defaultColor,
        fontSize:
            size?.value ??
            CaffFontSize.bodyLg.value,
        fontWeight:
            weight?.value ??
            CaffFontWeight
                .regular
                .value,
        fontStyle: isItalic
            ? FontStyle.italic
            : FontStyle.normal,
        decoration: decoration,
        inherit: false,
      ),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
