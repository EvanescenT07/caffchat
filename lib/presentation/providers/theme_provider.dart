import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global theme mode state (default to system)
final themeModeProvider =
    StateProvider<ThemeMode>(
      (ref) => ThemeMode.system,
    );
