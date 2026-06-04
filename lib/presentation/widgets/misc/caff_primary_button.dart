import 'package:caffchat/core/design/caff_radius.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:flutter/material.dart';

class CaffPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CaffPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primaryContainer,
          foregroundColor: colors.onPrimaryContainer,
          disabledBackgroundColor: colors.primaryContainer
              .withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: CaffRadius.xlAll,
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: colors.onPrimaryContainer,
                ),
              )
            : CaffText(
                text: text,
                size: CaffFontSize.btnTextSizeLg,
                weight: CaffFontWeight.semiBold,
                color: colors.onPrimaryContainer,
              ),
      ),
    );
  }
}
