import 'package:caffchat/core/design/caff_text.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CaffText(text: 'Home'),
      ),
    );
  }
}
