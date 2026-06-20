enum ConversationType {
  direct,
  group;

  static ConversationType fromString(
    String value,
  ) {
    return ConversationType.values
        .firstWhere(
          (e) => e.name == value,
          orElse: () =>
              ConversationType.direct,
        );
  }
}
