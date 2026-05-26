import 'package:caffchat/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform,
  );

  runApp(CaffChat());
}

class CaffChat extends StatefulWidget {
  const CaffChat({super.key});

  @override
  State<CaffChat> createState() =>
      _CaffChatState();
}

class _CaffChatState
    extends State<CaffChat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      home: Scaffold(
        body: Center(
          child: Text(
            'Welcome to CaffChat',
          ),
        ),
      ),
    );
  }
}
