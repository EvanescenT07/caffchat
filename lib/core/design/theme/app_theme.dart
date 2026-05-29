// Theme builder
import 'package:caffchat/core/design/theme/dark_color_scheme.dart';
import 'package:caffchat/core/design/theme/light_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData
  get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor:
        lightColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme
          .primaryContainer,
      foregroundColor: lightColorScheme
          .onPrimaryContainer,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        inherit: false,
      ),
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                lightColorScheme
                    .primary,
            foregroundColor:
                lightColorScheme
                    .onPrimary,
            minimumSize:
                const Size.fromHeight(
                  48,
                ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                    8,
                  ),
            ),
          ),
        ),
    inputDecorationTheme:
        InputDecorationTheme(
          filled: true,
          fillColor: lightColorScheme
              .surfaceContainerLow,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  24,
                ),
            borderSide: BorderSide.none,
          ),
        ),
    cardTheme: CardThemeData(
      color: lightColorScheme
          .surfaceContainerLowest,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16),
      ),
    ),
  );

  // Dark Theme
  static ThemeData
  get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor:
        darkColorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme
          .primaryContainer,
      foregroundColor: darkColorScheme
          .onPrimaryContainer,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        inherit: false,
      ),
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                darkColorScheme.primary,
            foregroundColor:
                darkColorScheme
                    .onPrimary,
            minimumSize:
                const Size.fromHeight(
                  48,
                ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(
                    8,
                  ),
            ),
          ),
        ),
    inputDecorationTheme:
        InputDecorationTheme(
          filled: true,
          fillColor: darkColorScheme
              .surfaceContainerLow,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                  24,
                ),
            borderSide: BorderSide.none,
          ),
        ),
    cardTheme: CardThemeData(
      color: darkColorScheme
          .surfaceContainerHigh,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16),
      ),
    ),
  );
}
