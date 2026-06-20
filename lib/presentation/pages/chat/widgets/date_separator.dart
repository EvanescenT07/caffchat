import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Centered pill label between message groups.
/// Shows "Today", "Yesterday", or formatted date.
class DateSeparator
    extends StatelessWidget {
  final DateTime date;

  const DateSeparator({
    super.key,
    required this.date,
  });

  String get _label {
    final now = DateTime.now();
    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );
    final dateOnly = DateTime(
      date.year,
      date.month,
      date.day,
    );
    final difference = today
        .difference(dateOnly)
        .inDays;

    if (difference == 0) {
      return 'Today';
    }

    if (difference == 1) {
      return 'Yesterday';
    }

    return DateFormat(
      'MMMM d, y',
    ).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colors = CaffColor.of(
      context,
    );

    return Padding(
      padding:
          const EdgeInsets.symmetric(
            vertical: 16,
          ),
      child: Center(
        child: Container(
          padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
          decoration: BoxDecoration(
            color: colors
                .surfaceContainerHigh,
            borderRadius:
                BorderRadius.circular(
                  8,
                ),
          ),
          child: CaffText(
            text: _label,
            size: CaffFontSize.labelSm,
            color:
                colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
