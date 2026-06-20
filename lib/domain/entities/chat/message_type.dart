// * Current Type Work only on Text since the bucket store is not available right now
enum MessageType {
  text,
  image,
  file,
  system;

  static MessageType fromString(
    String value,
  ) {
    return MessageType.values
        .firstWhere(
          (e) => e.name == value,
          orElse: () =>
              MessageType.text,
        );
  }
}
