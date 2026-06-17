import 'package:flutter/material.dart';

class CaffColor {
  final ColorScheme _scheme;

  const CaffColor._(this._scheme);

  static CaffColor of(
    BuildContext context,
  ) {
    return CaffColor._(
      Theme.of(context).colorScheme,
    );
  }

  // PRIMARY
  Color get primary => _scheme.primary;
  Color get onPrimary =>
      _scheme.onPrimary;
  Color get primaryContainer =>
      _scheme.primaryContainer;
  Color get onPrimaryContainer =>
      _scheme.onPrimaryContainer;
  Color get inversePrimary =>
      _scheme.inversePrimary;

  // Secondary
  Color get secondary =>
      _scheme.secondary;
  Color get onSecondary =>
      _scheme.onSecondary;
  Color get secondaryContainer =>
      _scheme.secondaryContainer;
  Color get onSecondaryContainer =>
      _scheme.onSecondaryContainer;

  // Tertiary
  Color get tertiary =>
      _scheme.tertiary;
  Color get onTertiary =>
      _scheme.onTertiary;
  Color get tertiaryContainer =>
      _scheme.tertiaryContainer;
  Color get onTertiaryContainer =>
      _scheme.onTertiaryContainer;

  // Error
  Color get error => _scheme.error;
  Color get onError => _scheme.onError;
  Color get errorContainer =>
      _scheme.errorContainer;
  Color get onErrorContainer =>
      _scheme.onErrorContainer;

  // Surface Hierarchy
  Color get surface => _scheme.surface;
  Color get onSurface =>
      _scheme.onSurface;
  Color get onSurfaceVariant =>
      _scheme.onSurfaceVariant;
  Color get surfaceDim =>
      _scheme.surfaceDim;
  Color get surfaceBright =>
      _scheme.surfaceBright;
  Color get surfaceContainerLowest =>
      _scheme.surfaceContainerLowest;
  Color get surfaceContainerLow =>
      _scheme.surfaceContainerLow;
  Color get surfaceContainer =>
      _scheme.surfaceContainer;
  Color get surfaceContainerHigh =>
      _scheme.surfaceContainerHigh;
  Color get surfaceContainerHighest =>
      _scheme.surfaceContainerHighest;
  Color get inverseSurface =>
      _scheme.inverseSurface;
  Color get onInverseSurface =>
      _scheme.onInverseSurface;

  // Outline
  Color get outline => _scheme.outline;
  Color get outlineVariant =>
      _scheme.outlineVariant;
  Color get surfaceTint =>
      _scheme.surfaceTint;

  // Chat Spesific Semantic Colors
  Color get chatBubbleOutgoing =>
      _scheme.brightness ==
          Brightness.light
      ? const Color(0xFFDCF8C6)
      : const Color(0xFF054740);

  Color get chatBubbleIncoming =>
      _scheme.brightness ==
          Brightness.light
      ? _scheme.surfaceContainerLowest
      : _scheme.surfaceContainerHigh;
}

extension CaffColorExtension
    on BuildContext {
  CaffColor get colors =>
      CaffColor.of(this);
}
