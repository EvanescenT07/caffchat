import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/l10n/app_localizations.dart';
import 'package:caffchat/presentation/providers/auth/auth_action_provider.dart';
import 'package:caffchat/presentation/widgets/misc/caff_primary_button.dart';
import 'package:caffchat/presentation/widgets/misc/caff_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordPage
    extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final l10n = AppLocalizations.of(
      context,
    );
    final formKey = useMemoized(
      GlobalKey<FormState>.new,
    );
    final currentPasswordController =
        useTextEditingController();
    final newPasswordController =
        useTextEditingController();
    final confirmPasswordController =
        useTextEditingController();

    final showCurrentPassword =
        useState(false);
    final showNewPassword = useState(
      false,
    );
    final showConfirmPassword =
        useState(false);

    final authState = ref.watch(
      authActionProvider,
    );
    final isLoading =
        authState is AsyncLoading;

    // Listen for Success/Error
    ref.listen(authActionProvider, (
      prev,
      next,
    ) {
      if (next is AsyncData &&
          prev is AsyncLoading) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: CaffText(
              text:
                  l10n.passwordUpdated,
            ),
          ),
        );
        Navigator.of(context).pop();
      }
      if (next is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: CaffText(
              text: l10n
                  .passwordUpdateFailed,
            ),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor:
          context.colors.surface,
      appBar: AppBar(
        backgroundColor:
            context.colors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(
            context,
          ).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: context
                .colors
                .onPrimaryContainer,
          ),
        ),
        title: CaffText(
          text: l10n.changePassword,
          size: CaffFontSize.titleLg,
          weight: CaffFontWeight.bold,
          color: context
              .colors
              .onPrimaryContainer,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: CaffSpacing.lg,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [
              const SizedBox(
                height: CaffSpacing.xl,
              ),

              // Current Password
              CaffText(
                text: l10n
                    .currentPassword,
                size:
                    CaffFontSize.bodyMd,
                weight: CaffFontWeight
                    .medium,
              ),
              const SizedBox(
                height: CaffSpacing.md,
              ),
              CaffTextField(
                controller:
                    currentPasswordController,
                hintText: l10n
                    .currentPassword,
                obscureText:
                    !showCurrentPassword
                        .value,
                enabled: !isLoading,
                textInputAction:
                    TextInputAction
                        .next,
                suffixIcon: IconButton(
                  onPressed: () =>
                      showCurrentPassword
                              .value =
                          !showCurrentPassword
                              .value,
                  icon: Icon(
                    showCurrentPassword
                            .value
                        ? Icons
                              .visibility_off_outlined
                        : Icons
                              .visibility_outlined,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return l10n
                        .currentPasswordRequired;
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: CaffSpacing.md,
              ),

              // New Password
              CaffText(
                text: l10n.newPassword,
                size:
                    CaffFontSize.bodyMd,
                weight: CaffFontWeight
                    .medium,
              ),
              const SizedBox(
                height: CaffSpacing.md,
              ),
              CaffTextField(
                controller:
                    newPasswordController,
                hintText:
                    l10n.newPassword,
                obscureText:
                    !showNewPassword
                        .value,
                enabled: !isLoading,
                textInputAction:
                    TextInputAction
                        .next,
                suffixIcon: IconButton(
                  onPressed: () =>
                      showCurrentPassword
                              .value =
                          !showCurrentPassword
                              .value,
                  icon: Icon(
                    showCurrentPassword
                            .value
                        ? Icons
                              .visibility_off_outlined
                        : Icons
                              .visibility_outlined,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return l10n
                        .newPasswordRequired;
                  }
                  if (value.length <
                      6) {
                    return l10n
                        .newPasswordMinLength;
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: CaffSpacing.md,
              ),

              // Confirm New Password
              CaffText(
                text: l10n
                    .confirmNewPassword,
                size:
                    CaffFontSize.bodyMd,
                weight: CaffFontWeight
                    .medium,
              ),
              const SizedBox(
                height: CaffSpacing.md,
              ),
              CaffTextField(
                controller:
                    confirmPasswordController,
                hintText: l10n
                    .confirmNewPassword,
                obscureText:
                    !showConfirmPassword
                        .value,
                enabled: !isLoading,
                textInputAction:
                    TextInputAction
                        .next,
                suffixIcon: IconButton(
                  onPressed: () =>
                      showConfirmPassword
                              .value =
                          !showConfirmPassword
                              .value,
                  icon: Icon(
                    showConfirmPassword
                            .value
                        ? Icons
                              .visibility_off_outlined
                        : Icons
                              .visibility_outlined,
                    color: context
                        .colors
                        .onSurfaceVariant,
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return l10n
                        .newPasswordRequired;
                  }
                  if (value !=
                      newPasswordController
                          .text) {
                    return l10n
                        .newPasswordMismatch;
                  }
                  return null;
                },
                onFieldSubmitted: (_) =>
                    _handleChangePassword(
                      ref,
                      formKey,
                      currentPasswordController,
                      newPasswordController,
                    ),
              ),

              const SizedBox(
                height: CaffSpacing.xl,
              ),

              // Update Button
              CaffPrimaryButton(
                onPressed: () =>
                    _handleChangePassword(
                      ref,
                      formKey,
                      currentPasswordController,
                      newPasswordController,
                    ),
                isLoading: isLoading,
                text:
                    l10n.updatePassword,
              ),

              const SizedBox(
                height: CaffSpacing.xl,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleChangePassword(
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController
    currentPasswordController,
    TextEditingController
    newPasswordController,
  ) {
    if (!(formKey.currentState
            ?.validate() ??
        false)) {
      return;
    }
    ref
        .read(
          authActionProvider.notifier,
        )
        .changePassword(
          currentPassword:
              currentPasswordController
                  .text,
          newPassword:
              newPasswordController
                  .text,
        );
  }
}
