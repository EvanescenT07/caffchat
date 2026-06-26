import 'package:intl/intl.dart';

/// Extension for smart timestamp formatting in chat UI.
///
/// Usage: `dateTime.toChatTimestamp()` → "10:42 AM"
///        `dateTime.toMessageTimestamp()` → "10:42 AM"
extension TimestampFormatter on DateTime {
  /// For conversation list tiles.
  /// Same day: "10:42 AM", yesterday: "Yesterday",
  /// same week: "Tuesday", older: "11/04/23"
  String toChatTimestamp() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(year, month, day);
    final difference = today.difference(dateOnly).inDays;

    if (difference == 0) {
      return DateFormat('h:mm a').format(this);
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return DateFormat('EEEE').format(this);
    } else {
      return DateFormat('MM/dd/yy').format(this);
    }
  }

  /// For message bubbles — always shows time.
  String toMessageTimestamp() {
    return DateFormat('h:mm a').format(this);
  }
}
