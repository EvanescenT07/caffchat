enum MessageStatus {
  sending,
  sent,
  delivered,
  read;

  static MessageStatus fromString(
    String value,
  ) {
    return MessageStatus.values
        .firstWhere(
          (e) => e.name == value,
          orElse: () =>
              MessageStatus.sent,
        );
  }
}
