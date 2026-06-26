import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/utils/phone_normalizer.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/l10n/app_localizations.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';
import 'package:caffchat/presentation/widgets/misc/caff_primary_button.dart';
import 'package:caffchat/presentation/widgets/misc/caff_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfilePage
    extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final l10n = AppLocalizations.of(
      context,
    );
    final authRepo = ref.watch(
      authRepositoryProvider,
    );
    final currentUser =
        authRepo.currentUser;
    final uid = currentUser?.uid ?? '';

    final nameController =
        useTextEditingController();
    final phoneController =
        useTextEditingController();
    final emailText = useState('');
    final isLoading = useState(false);
    final discoverableByPhone =
        useState(true);
    final profileLoaded = useState(
      false,
    );

    // Load current profile data
    useEffect(() {
      if (uid.isEmpty) return null;
      final profileRepo = ref.read(
        userProfileRepositoryProvider,
      );
      profileRepo.getProfile(uid).then((
        result,
      ) {
        if (result is Success) {
          final profile =
              result.resultValue;
          if (!profileLoaded.value) {
            nameController.text =
                profile?.displayName ??
                '';
            phoneController.text =
                profile?.phoneNumber ??
                '';
            emailText.value =
                profile?.email ?? '';
            discoverableByPhone
                .value = profile!
                .discoverableByPhone;
            profileLoaded.value = true;
          }
        }
      });
      return null;
    }, [uid]);

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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: CaffSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: CaffSpacing.xl,
            ),
            // Avatar
            Center(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      content: CaffText(
                        text: l10n
                            .featureNotReady,
                      ),
                      backgroundColor:
                          context
                              .colors
                              .onSecondaryContainer,
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor:
                          context
                              .colors
                              .surfaceContainerHigh,
                      child: Icon(
                        Icons
                            .person_outline,
                        size: 56,
                        color: context
                            .colors
                            .onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(
                      height:
                          CaffSpacing
                              .sm,
                    ),
                    CaffText(
                      text: l10n
                          .changePhoto,
                      size: CaffFontSize
                          .bodyMd,
                      color: context
                          .colors
                          .primaryContainer,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: CaffSpacing.xl,
            ),

            // Full Name
            CaffText(
              text: l10n.fullName,
              size: CaffFontSize.bodyMd,
              weight:
                  CaffFontWeight.medium,
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),
            CaffTextField(
              controller:
                  nameController,
              hintText:
                  l10n.enterYourName,
              keyboardType:
                  TextInputType.name,
              textInputAction:
                  TextInputAction.next,
              prefixIcon: Icon(
                Icons.person_outline,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
            ),
            const SizedBox(
              height: CaffSpacing.md,
            ),

            // Phhone Number
            CaffText(
              text: l10n
                  .phoneNumberOptional,
              size: CaffFontSize.bodyMd,
              weight:
                  CaffFontWeight.medium,
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),
            CaffTextField(
              controller:
                  phoneController,
              hintText:
                  l10n.phoneNumberHint,
              keyboardType:
                  TextInputType.phone,
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
            ),
            const SizedBox(
              height: CaffSpacing.md,
            ),

            // Email (read-only)
            CaffText(
              text: l10n.emailAddress,
              size: CaffFontSize.bodyMd,
              weight:
                  CaffFontWeight.medium,
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),
            CaffTextField(
              controller:
                  TextEditingController(
                    text:
                        emailText.value,
                  ),
              hintText: '',
              enabled: false,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
            ),
            const SizedBox(
              height: CaffSpacing.md,
            ),

            // Discoverable by Phone Toggle
            SwitchListTile(
              contentPadding:
                  EdgeInsets.zero,
              title: CaffText(
                text: l10n
                    .discoverableByPhone,
                size:
                    CaffFontSize.bodyMd,
                weight: CaffFontWeight
                    .medium,
              ),
              subtitle: CaffText(
                text: l10n
                    .discoverableByPhoneSubtitle,
                size:
                    CaffFontSize.bodyMd,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
              value: discoverableByPhone
                  .value,
              onChanged: (val) =>
                  discoverableByPhone
                          .value =
                      val,
              activeThumbColor: context
                  .colors
                  .primaryContainer,
            ),
            const SizedBox(
              height: CaffSpacing.xl,
            ),
          ],
        ),
      ),

      // Save button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
          CaffSpacing.lg,
        ),
        child: SafeArea(
          child: CaffPrimaryButton(
            text: l10n.saveChanges,
            isLoading: isLoading.value,
            onPressed: () => _handleSave(
              context,
              ref,
              uid: uid,
              displayName:
                  nameController.text
                      .trim(),
              phoneNumber:
                  phoneController.text
                      .trim(),
              discoverableByPhone:
                  discoverableByPhone
                      .value,
              isLoading: isLoading,
              l10n: l10n,
            ),
          ),
        ),
      ),
    );
  }

  void _handleSave(
    BuildContext context,
    WidgetRef ref, {
    required String uid,
    required String displayName,
    required String phoneNumber,
    required bool discoverableByPhone,
    required ValueNotifier<bool>
    isLoading,
    required AppLocalizations l10n,
  }) async {
    if (displayName.isEmpty) return;
    isLoading.value = true;

    final profileRepo = ref.read(
      userProfileRepositoryProvider,
    );

    // Normalize phone before saving
    final normalizedPhoneNumber =
        phoneNumber.isNotEmpty
        ? PhoneNormalizer.normalize(
            phoneNumber,
          )
        : null;

    final result = await profileRepo
        .updateProfile(
          uid: uid,
          displayName: displayName,
          phoneNumber:
              normalizedPhoneNumber,
        );

    isLoading.value = false;

    if (!context.mounted) return;

    switch (result) {
      case Success():
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text(
              l10n.profileUpdated,
            ),
          ),
        );
        Navigator.of(context).pop();
      case Failed(:final message):
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor:
                context.colors.error,
          ),
        );
      case Cancel():
        break;
    }
  }
}
