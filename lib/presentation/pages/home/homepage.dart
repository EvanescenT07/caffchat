import 'package:caffchat/l10n/app_localizations.dart';
import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/presentation/pages/chat/chat_list_page.dart';
import 'package:caffchat/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage
    extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final currentIndex = useState(0);
    final l10n = AppLocalizations.of(
      context,
    );

    final pages = [
      const ChatListPage(),
      // Status tab placeholder
      Center(
        child: CaffText(
          text: l10n.statusComingSoon,
          size: CaffFontSize.bodyLg,
          color: context
              .colors
              .onSurfaceVariant,
        ),
      ),
      // Setting tab placeholder
      const SettingsPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:
            currentIndex.value,
        onDestinationSelected: (index) {
          currentIndex.value = index;
        },
        backgroundColor:
            context.colors.surface,
        indicatorColor: context
            .colors
            .primaryContainer
            .withValues(alpha: 0.3),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.chat_outlined,
              color: context
                  .colors
                  .onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.chat,
              color: context
                  .colors
                  .primaryContainer,
            ),
            label: l10n.chats,
          ),
          NavigationDestination(
            icon: Icon(
              Icons
                  .radio_button_checked_outlined,
              color: context
                  .colors
                  .onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons
                  .radio_button_checked,
              color: context
                  .colors
                  .primaryContainer,
            ),
            label: l10n.status,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
              color: context
                  .colors
                  .onSurfaceVariant,
            ),
            selectedIcon: Icon(
              Icons.settings,
              color: context
                  .colors
                  .primaryContainer,
            ),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}
