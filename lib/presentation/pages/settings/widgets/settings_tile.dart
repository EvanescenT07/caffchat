import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:flutter/material.dart';

class SettingsTile
    extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;
  final Color? titleColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color:
            iconColor ??
            context
                .colors
                .onSurfaceVariant,
      ),
      title: CaffText(
        text: title,
        size: CaffFontSize.bodyLg,
        color:
            titleColor ??
            context.colors.onSurface,
      ),
      trailing:
          trailing ??
          (onTap != null
              ? Icon(
                  Icons.chevron_right,
                  color: context
                      .colors
                      .onSurfaceVariant,
                )
              : null),
      onTap: onTap,
    );
  }
}
