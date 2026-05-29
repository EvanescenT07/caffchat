import 'package:caffchat/caff_app.dart';
import 'package:caffchat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: CaffApp(),
    ),
  );
}
