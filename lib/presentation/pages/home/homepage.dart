import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage
    extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final authRepository = ref.watch(
      authRepositoryProvider,
    );
    final currentUser =
        authRepository.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: CaffText(
          text: 'Homepage',
          color:
              context.colors.onPrimary,
        ),
      ),
      body: Column(
        children: [
          CaffText(text: 'Hello'),
          CaffText(
            text:
                currentUser?.email ??
                '',
          ),
        ],
      ),
    );
  }
}
