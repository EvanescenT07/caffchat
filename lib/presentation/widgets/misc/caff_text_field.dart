import 'package:caffchat/core/design/caff_radius.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:flutter/material.dart';

// - [outlined]: Transparent background with visible border.
// Use for form inputs (login, register, settings).
// - [filled]: Filled background with no border.
// Use for inline inputs (chat, search bars).
enum CaffTextFieldVariant {
  outlined,
  filled,
}

class CaffTextField
    extends StatelessWidget {
  final TextEditingController?
  controller;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction?
  textInputAction;
  final String? Function(String?)?
  validator;
  final ValueChanged<String>?
  onFieldSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final CaffTextFieldVariant variant;

  const CaffTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled = true,
    this.variant =
        CaffTextFieldVariant.outlined,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
      context,
    ).colorScheme;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted:
          onFieldSubmitted,
      focusNode: focusNode,
      enabled: enabled,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize:
            CaffFontSize.bodyLg.value,
        color: colors.onSurface,
      ),
      decoration: _buildDecoration(
        colors,
      ),
    );
  }

  InputDecoration _buildDecoration(
    ColorScheme colors,
  ) {
    final contentPadding =
        const EdgeInsets.symmetric(
          horizontal: CaffSpacing.md,
          vertical: CaffSpacing.md,
        );

    final hintStyle = TextStyle(
      color: colors.onSurfaceVariant,
      fontSize:
          CaffFontSize.bodyLg.value,
    );

    return switch (variant) {
      CaffTextFieldVariant.outlined =>
        InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: false,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  CaffRadius.md,
                ),
            borderSide: BorderSide(
              color: colors.outline,
            ),
          ),
          enabledBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.md,
                    ),
                borderSide: BorderSide(
                  color: colors
                      .outlineVariant,
                ),
              ),
          focusedBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.md,
                    ),
                borderSide: BorderSide(
                  color: colors.primary,
                  width: 1.5,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  CaffRadius.md,
                ),
            borderSide: BorderSide(
              color: colors.error,
            ),
          ),
          focusedErrorBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.md,
                    ),
                borderSide: BorderSide(
                  color: colors.error,
                  width: 1.5,
                ),
              ),
          contentPadding:
              contentPadding,
          hintStyle: hintStyle,
        ),
      CaffTextFieldVariant.filled =>
        InputDecoration(
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: colors
              .surfaceContainerLow,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  CaffRadius.xl,
                ),
            borderSide: BorderSide.none,
          ),
          enabledBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.xl,
                    ),
                borderSide:
                    BorderSide.none,
              ),
          focusedBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.xl,
                    ),
                borderSide: BorderSide(
                  color: colors.primary,
                  width: 1.5,
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  CaffRadius.xl,
                ),
            borderSide: BorderSide(
              color: colors.error,
            ),
          ),
          focusedErrorBorder:
              OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                      CaffRadius.xl,
                    ),
                borderSide: BorderSide(
                  color: colors.error,
                  width: 1.5,
                ),
              ),
          contentPadding:
              contentPadding,
          hintStyle: hintStyle,
        ),
    };
  }
}
