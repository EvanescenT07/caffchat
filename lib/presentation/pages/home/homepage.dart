import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/router/app_route_name.dart';
import 'package:caffchat/presentation/pages/chat/chat_list_page.dart';
import 'package:caffchat/presentation/providers/auth/auth_action_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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
    final pages = [
      const ChatListPage(),
      // Status tab placeholder
      Center(
        child: CaffText(
          text:
              'Status - Coming Soon!',
          size: CaffFontSize.bodyLg,
          color: context
              .colors
              .onSurfaceVariant,
        ),
      ),
      // Setting tab placeholder
      _buildSettingsTab(
        context,
        ref,
        context.colors,
      ),
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
            label: 'Chats',
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
            label: 'Status',
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
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTab(
    BuildContext context,
    WidgetRef ref,
    CaffColor colors,
  ) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CaffText(
            text:
                'Settings — Coming soon',
            size: CaffFontSize.bodyLg,
            color:
                colors.onSurfaceVariant,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              await ref
                  .read(
                    authActionProvider
                        .notifier,
                  )
                  .signOut();
              if (context.mounted) {
                context.go(
                  RouteName.login,
                );
              }
            },
            icon: const Icon(
              Icons.logout,
            ),
            label: const Text(
              'Sign Out',
            ),
            style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                      colors.error,
                  foregroundColor:
                      colors.onError,
                ),
          ),
        ],
      ),
    );
  }
}
