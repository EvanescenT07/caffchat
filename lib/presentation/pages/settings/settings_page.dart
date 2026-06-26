import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/router/app_route_name.dart';
import 'package:caffchat/l10n/app_localizations.dart';
import 'package:caffchat/presentation/pages/settings/widgets/section_header.dart';
import 'package:caffchat/presentation/pages/settings/widgets/profile_header.dart';
import 'package:caffchat/presentation/pages/settings/widgets/settings_tile.dart';
import 'package:caffchat/presentation/providers/app_version_provider.dart';
import 'package:caffchat/presentation/providers/auth/auth_action_provider.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/locale_provider.dart';
import 'package:caffchat/presentation/providers/theme_provider.dart';
import 'package:caffchat/presentation/providers/user/current_user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage
    extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final l10n = AppLocalizations.of(
      context,
    );
    final currentProfileAsync = ref
        .watch(
          currentUserProfileProvider,
        );
    final locale = ref.watch(
      localeProvider,
    );
    final themeMode = ref.watch(
      themeModeProvider,
    );
    final appVersion = ref.watch(
      appVersionProvider,
    );

    return Scaffold(
      backgroundColor:
          context.colors.surface,
      appBar: AppBar(
        backgroundColor:
            context.colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: CaffText(
          text: l10n.settings,
          size: CaffFontSize.titleLg,
          weight: CaffFontWeight.bold,
          color:
              context.colors.onSurface,
        ),
      ),
      body: ListView(
        children: [
          // Profile Header
          ProfileHeader(
            displayName:
                currentProfileAsync
                    .whenOrNull(
                      data: (profile) =>
                          profile
                              ?.displayName,
                    ) ??
                '',

            email:
                currentProfileAsync
                    .whenOrNull(
                      data: (profile) =>
                          profile
                              ?.email,
                    ) ??
                '',
            onTap: () =>
                context.pushNamed(
                  RouteName.editProfile,
                ),
          ),
          const SizedBox(
            height: CaffSpacing.md,
          ),

          // Account Section
          SectionHeader(
            title: l10n.account,
          ),
          SettingsTile(
            icon: Icons.person_outline,
            title: l10n.editProfile,
            onTap: () =>
                context.pushNamed(
                  RouteName.editProfile,
                ),
          ),
          SettingsTile(
            icon: Icons.lock_outline,
            title: l10n.changePassword,
            onTap: () =>
                context.pushNamed(
                  RouteName
                      .changePassword,
                ),
          ),

          const Divider(height: 1),

          SectionHeader(
            title: l10n.preferences,
          ),

          // Language Switcher
          SettingsTile(
            icon: Icons.language,
            title: l10n.language,
            trailing: DropdownButton<Locale>(
              value: locale,
              underline:
                  const SizedBox.shrink(),
              items: [
                DropdownMenuItem(
                  value: const Locale(
                    'en',
                  ),
                  child: CaffText(
                    text: l10n.english,
                  ),
                ),
                DropdownMenuItem(
                  value: const Locale(
                    'id',
                  ),
                  child: CaffText(
                    text:
                        l10n.indonesian,
                  ),
                ),
              ],
              onChanged: (newLocale) {
                if (newLocale != null) {
                  ref
                          .read(
                            localeProvider
                                .notifier,
                          )
                          .state =
                      newLocale;
                }
              },
            ),
          ),

          // Theme switcher
          Padding(
            padding:
                const EdgeInsets.symmetric(
                  horizontal:
                      CaffSpacing.md,
                  vertical:
                      CaffSpacing.sm,
                ),
            child: Row(
              children: [
                Icon(
                  Icons
                      .brightness_6_outlined,
                  color: context
                      .colors
                      .onSurfaceVariant,
                ),
                const SizedBox(
                  width: CaffSpacing.md,
                ),
                CaffText(
                  text: l10n.theme,
                  size: CaffFontSize
                      .bodyLg,
                  color: context
                      .colors
                      .onSurface,
                ),
                const Spacer(),
                SegmentedButton<
                  ThemeMode
                >(
                  segments: [
                    ButtonSegment(
                      value: ThemeMode
                          .light,
                      icon: const Icon(
                        Icons
                            .light_mode_outlined,
                        size: 18,
                      ),
                    ),
                    ButtonSegment(
                      value: ThemeMode
                          .system,
                      icon: const Icon(
                        Icons
                            .brightness_auto_outlined,
                        size: 18,
                      ),
                    ),
                    ButtonSegment(
                      value: ThemeMode
                          .dark,
                      icon: const Icon(
                        Icons
                            .dark_mode_outlined,
                        size: 18,
                      ),
                    ),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (selected) {
                    ref
                        .read(
                          themeModeProvider
                              .notifier,
                        )
                        .state = selected
                        .first;
                  },
                  showSelectedIcon:
                      false,
                  style: ButtonStyle(
                    visualDensity:
                        VisualDensity
                            .compact,
                    tapTargetSize:
                        MaterialTapTargetSize
                            .shrinkWrap,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: CaffSpacing.md,
          ),

          const Divider(height: 1),

          // About Section
          SectionHeader(
            title: l10n.about,
          ),
          SettingsTile(
            icon: Icons.info_outline,
            title: l10n.appName,
            trailing: appVersion.when(
              data: (version) => CaffText(
                text: 'v$version',
                size:
                    CaffFontSize.bodyMd,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
              loading: () => const SizedBox(
                width: 16,
                height: 16,
                child:
                    CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
              ),
              error: (_, _) => CaffText(
                text: 'v?.?.?',
                size:
                    CaffFontSize.bodyMd,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
            ),
          ),

          const Divider(height: 1),

          // Sign Out
          SectionHeader(
            title: l10n.dangerZone,
          ),
          SettingsTile(
            icon: Icons.logout_rounded,
            title: l10n.signOut,
            iconColor:
                context.colors.error,
            onTap: () =>
                _showSignOutConfirmation(
                  context,
                  ref,
                  l10n,
                ),
          ),

          const SizedBox(
            height: CaffSpacing.xl,
          ),
        ],
      ),
    );
  }

  void _showSignOutConfirmation(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          l10n.signOutConfirmTitle,
        ),
        content: Text(
          l10n.signOutConfirmMessage,
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(
                  dialogContext,
                ).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style:
                FilledButton.styleFrom(
                  backgroundColor:
                      context
                          .colors
                          .error,
                ),
            onPressed: () async {
              Navigator.of(
                dialogContext,
              ).pop();
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
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
