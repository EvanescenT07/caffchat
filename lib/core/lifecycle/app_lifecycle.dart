import 'package:caffchat/core/lifecycle/app_resume.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Lifecycle wrapper widget using Flutter Hooks.
//
// Wraps the child to observe app lifecycle transitions.
// On resume, triggers session validation via AppResume provider.
class AppLifecycle
    extends HookConsumerWidget {
  final Widget child;

  const AppLifecycle({
    super.key,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    useOnAppLifecycleStateChange((
      previous,
      current,
    ) {
      if (current ==
          AppLifecycleState.resumed) {
        ref
            .read(
              appResumeProvider
                  .notifier,
            )
            .onResume();
      }
    });
    return child;
  }
}
