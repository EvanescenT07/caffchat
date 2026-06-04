// Root Application
import 'package:caffchat/core/design/theme/app_theme.dart';
import 'package:caffchat/core/lifecycle/app_lifecycle.dart';
import 'package:caffchat/core/router/app_router.dart';
import 'package:caffchat/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CaffChat
    extends HookConsumerWidget {
  const CaffChat({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final themeMode = ref.watch(
      themeModeProvider,
    );
    return AppLifecycle(
      child: MaterialApp.router(
        title: 'CaffChat',
        debugShowCheckedModeBanner:
            false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
