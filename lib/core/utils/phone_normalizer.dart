/// Normalizes phone input to E.164 international format.
///
/// Rules:
/// - Strips spaces, dashes, and parentheses
/// - Converts Indonesian local '0' prefix → '+62'
///   (e.g., '08123456789' → '+628123456789')
/// - Prepends '+' if bare country code given
///   (e.g., '628123456789' → '+628123456789')
/// - Returns null if input is null or blank
class PhoneNormalizer {
  PhoneNormalizer._();

  static String? normalize(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;

    // Strip formatting characters: spaces, dashes, parens
    String cleaned = raw.replaceAll(
      RegExp(r'[\s\-\(\)]'),
      '',
    );

    // Indonesian local format: 0xxx → +62xxx
    if (cleaned.startsWith('0')) {
      cleaned = '+62${cleaned.substring(1)}';
    }
    // Bare country code without +: 62xxx → +62xxx
    else if (cleaned.startsWith('62') &&
        !cleaned.startsWith('+')) {
      cleaned = '+$cleaned';
    }
    // Any other number without +: prepend +
    else if (!cleaned.startsWith('+')) {
      cleaned = '+$cleaned';
    }

    return cleaned;
  }
}
