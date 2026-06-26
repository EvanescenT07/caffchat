import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/presentation/providers/app_version_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Displays the current app version from pubspec.yaml.
/// Shows nothing on load or error — silent fallback.
class AppVersionText
    extends ConsumerWidget {
  const AppVersionText({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final versionAsync = ref.watch(
      appVersionProvider,
    );
    return versionAsync.when(
      data: (version) => CaffText(
        text: 'v$version',
        size: CaffFontSize.labelSm,
        color: context
            .colors
            .outlineVariant,
      ),
      loading: () =>
          const SizedBox.shrink(),
      error: (_, _) =>
          const SizedBox.shrink(),
    );
  }
}
