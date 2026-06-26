import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_radius.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/utils/phone_normalizer.dart';
import 'package:caffchat/domain/entities/helper/result/result.dart';
import 'package:caffchat/presentation/providers/chat/chat_repository_provider.dart';
import 'package:caffchat/presentation/providers/user/user_profile_repository_provider.dart';
import 'package:caffchat/presentation/widgets/misc/caff_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewChatDialog
    extends HookConsumerWidget {
  final String currentUserId;
  final String? currentUserPhone;
  final ValueChanged<String>
  onChatCreated;

  const NewChatDialog({
    super.key,
    required this.currentUserId,
    required this.onChatCreated,
    this.currentUserPhone,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final phoneController =
        useTextEditingController();
    final errorText = useState<String?>(
      null,
    );
    final isLoading = useState(false);

    return Dialog(
      backgroundColor: context
          .colors
          .surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: CaffRadius.xlAll,
      ),
      insetPadding:
          const EdgeInsets.symmetric(
            horizontal: CaffSpacing.lg,
          ),
      child: Padding(
        padding: const EdgeInsets.all(
          CaffSpacing.lg,
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Title
            // Title
            CaffText(
              text: 'New Chat',
              size: CaffFontSize.bodyMd,
              weight:
                  CaffFontWeight.bold,
              color: context
                  .colors
                  .onSurface,
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),
            // Subtitle
            CaffText(
              text:
                  'Enter a phone number to start a conversation '
                  'with someone on CaffChat.',
              size: CaffFontSize
                  .headlineSm,
              color: context
                  .colors
                  .onSurfaceVariant,
            ),
            const SizedBox(
              height: CaffSpacing.lg,
            ),
            // Phone Number Label
            CaffText(
              text: 'Phone Number',
              size:
                  CaffFontSize.labelSm,
              weight: CaffFontWeight
                  .semiBold,
              color: context
                  .colors
                  .primaryContainer,
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),
            // Phone Input
            CaffTextField(
              controller:
                  phoneController,
              hintText:
                  '+62 812-3456-7890',
              keyboardType:
                  TextInputType.phone,
              textInputAction:
                  TextInputAction.done,
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: context
                    .colors
                    .onSurfaceVariant,
              ),
              onFieldSubmitted: (_) =>
                  _handleStartChat(
                    context,
                    ref,
                    phoneController:
                        phoneController,
                    errorText:
                        errorText,
                    isLoading:
                        isLoading,
                  ),
            ),
            // Error Message
            if (errorText.value !=
                null) ...[
              const SizedBox(
                height: CaffSpacing.sm,
              ),
              CaffText(
                text: errorText.value!,
                size:
                    CaffFontSize.bodyMd,
                color: context
                    .colors
                    .error,
              ),

              const SizedBox(
                height: CaffSpacing.lg,
              ),
            ],

            const SizedBox(
              height: CaffSpacing.lg,
            ),

            // Start Chat Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed:
                    isLoading.value
                    ? null
                    : () => _handleStartChat(
                        context,
                        ref,
                        phoneController:
                            phoneController,
                        errorText:
                            errorText,
                        isLoading:
                            isLoading,
                      ),
                style: FilledButton.styleFrom(
                  backgroundColor: context
                      .colors
                      .primaryContainer,
                  foregroundColor: context
                      .colors
                      .onPrimaryContainer,
                  padding:
                      const EdgeInsets.symmetric(
                        vertical:
                            CaffSpacing
                                .md,
                      ),
                  shape:
                      RoundedRectangleBorder(
                        borderRadius:
                            CaffRadius
                                .mdAll,
                      ),
                ),
                icon: isLoading.value
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth:
                              2,
                          color: context
                              .colors
                              .onPrimaryContainer,
                        ),
                      )
                    : const Icon(
                        Icons
                            .send_rounded,
                      ),
                label: CaffText(
                  text: 'Start Chat',
                  weight: CaffFontWeight
                      .semiBold,
                  color: context
                      .colors
                      .onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(
              height: CaffSpacing.sm,
            ),

            // Cancel Button
            Center(
              child: TextButton(
                onPressed: () =>
                    Navigator.of(
                      context,
                    ).pop(),
                child: CaffText(
                  text: 'Cancel',
                  size: CaffFontSize
                      .bodyMd,
                  color: context
                      .colors
                      .onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleStartChat(
    BuildContext context,
    WidgetRef ref, {
    required TextEditingController
    phoneController,
    required ValueNotifier<String?>
    errorText,
    required ValueNotifier<bool>
    isLoading,
  }) async {
    final rawPhone = phoneController
        .text
        .trim();
    // Step 1: Empty check
    if (rawPhone.isEmpty) {
      errorText.value =
          'Please enter a phone number';
      return;
    }
    // Step 2: Minimum digit validation
    final digitsOnly = rawPhone
        .replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length < 8) {
      errorText.value =
          'Please enter a valid phone number';
      return;
    }
    // Step 3: Normalize
    final normalizedPhone =
        PhoneNormalizer.normalize(
          rawPhone,
        );
    if (normalizedPhone == null) {
      errorText.value =
          'Please enter a valid phone number';
      return;
    }
    // Step 4: Self-chat prevention
    if (currentUserPhone != null &&
        currentUserPhone ==
            normalizedPhone) {
      errorText.value =
          'You cannot start a chat with yourself';
      return;
    }
    // Clear error, start loading
    errorText.value = null;
    isLoading.value = true;
    // Step 5: Look up user by phone number
    final profileRepo = ref.read(
      userProfileRepositoryProvider,
    );
    final lookupResult =
        await profileRepo
            .findByPhoneNumber(
              normalizedPhone,
            );
    if (!context.mounted) return;
    switch (lookupResult) {
      case Success(:final value):
        // Additional self-check by UID (in case phone didn't match)
        if (value.uid ==
            currentUserId) {
          isLoading.value = false;
          errorText.value =
              'You cannot start a chat with yourself';
          return;
        }
        // Step 6: Create or get conversation
        final chatRepo = ref.read(
          chatRepositoryProvider,
        );
        final chatResult = await chatRepo
            .getOrCreateDirectConversation(
              currentUserId:
                  currentUserId,
              otherUserId: value.uid,
            );
        if (!context.mounted) return;
        isLoading.value = false;
        switch (chatResult) {
          case Success(:final value):
            Navigator.of(context).pop();
            onChatCreated(value.id);
          case Failed(:final message):
            errorText.value = message;
          case Cancel():
            break;
        }
      case Failed(:final message):
        isLoading.value = false;
        errorText.value = message;
      case Cancel():
        isLoading.value = false;
    }
  }
}
