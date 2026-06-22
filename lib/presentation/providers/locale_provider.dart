import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

// Holds the current app locale — defaults to English.
// Update via: ref.read(localeProvider.notifier).state = Locale('id');
final localeProvider =
    StateProvider<Locale>(
      (ref) => const Locale('en'),
    );
