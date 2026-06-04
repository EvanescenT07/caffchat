import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_radius.dart';
import 'package:caffchat/core/design/caff_spacing.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/router/app_route_name.dart';
import 'package:caffchat/domain/entitites/result/result.dart';
import 'package:caffchat/presentation/providers/auth/auth_action_provider.dart';
import 'package:caffchat/presentation/widgets/misc/caff_primary_button.dart';
import 'package:caffchat/presentation/widgets/misc/caff_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage
    extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final colors = CaffColor.of(
      context,
    );
    final formKey = useMemoized(
      GlobalKey<FormState>.new,
    );
    final displayNameController =
        useTextEditingController();
    final emailController =
        useTextEditingController();
    final passwordController =
        useTextEditingController();
    final confirmPasswordController =
        useTextEditingController();
    final passwordVisible = useState(
      false,
    );
    final confirmPasswordVisible =
        useState(false);
    final authState = ref.watch(
      authActionProvider,
    );
    final isLoading =
        authState is AsyncLoading;

    // Listen for auth errors and show snackbar
    ref.listen(authActionProvider, (
      previous,
      next,
    ) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text(
              next.error.toString(),
            ),
            backgroundColor:
                colors.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: colors
                .onPrimaryContainer,
          ),
        ),
        title: CaffText(
          text: 'Create Account',
          size: CaffFontSize.titleLg,
          weight: CaffFontWeight.bold,
          color:
              colors.onPrimaryContainer,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(
                horizontal:
                    CaffSpacing.lg,
              ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                const SizedBox(
                  height: CaffRadius.md,
                ),

                // Subtitle
                Center(
                  child: CaffText(
                    text:
                        'Please provide yourname and an\noptional profile photo',
                    size: CaffFontSize
                        .bodyMd,
                    color: colors
                        .onSurfaceVariant,
                    align: TextAlign
                        .center,
                  ),
                ),

                const SizedBox(
                  height:
                      CaffSpacing.lg,
                ),

                // Profile avatar placeholder
                // TODO: Wire photo uploade with Firebase Storage
                Center(
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Feature not ready yet',
                          ),
                          backgroundColor:
                              colors
                                  .onSecondaryContainer,
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundColor:
                              colors
                                  .surfaceContainerHigh,
                          child: Icon(
                            Icons
                                .person_outline,
                            size: 56,
                            color: colors
                                .onSurfaceVariant,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: colors
                                  .primaryContainer,
                              shape: BoxShape
                                  .circle,
                              border: Border.all(
                                color: colors
                                    .surface,
                                width:
                                    1,
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: colors
                                  .onPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height:
                      CaffSpacing.xl,
                ),

                // Display name label
                CaffText(
                  text: 'Display Name',
                  size: CaffFontSize
                      .bodyMd,
                  weight: CaffFontWeight
                      .medium,
                ),

                const SizedBox(
                  height:
                      CaffSpacing.sm,
                ),

                // Display name field
                CaffTextField(
                  controller:
                      displayNameController,
                  hintText:
                      'Enter your name',
                  keyboardType:
                      TextInputType
                          .name,
                  textInputAction:
                      TextInputAction
                          .next,
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Display name is required';
                    }
                    if (value
                            .trim()
                            .length <
                        3) {
                      return 'Name must be at least 3 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height:
                      CaffSpacing.md,
                ),

                // Email Address label
                CaffText(
                  text: 'Email Address',
                  size: CaffFontSize
                      .bodyMd,
                  weight: CaffFontWeight
                      .medium,
                ),
                const SizedBox(
                  height:
                      CaffSpacing.sm,
                ),
                // Email field
                CaffTextField(
                  controller:
                      emailController,
                  hintText:
                      'example@email.com',
                  keyboardType:
                      TextInputType
                          .emailAddress,
                  textInputAction:
                      TextInputAction
                          .next,
                  enabled: !isLoading,
                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(
                      value.trim(),
                    )) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height:
                      CaffSpacing.md,
                ),
                // Password label
                CaffText(
                  text: 'Password',
                  size: CaffFontSize
                      .bodyMd,
                  weight: CaffFontWeight
                      .medium,
                ),
                const SizedBox(
                  height:
                      CaffSpacing.sm,
                ),
                // Password field
                CaffTextField(
                  controller:
                      passwordController,
                  hintText:
                      'Enter your password',
                  obscureText:
                      !passwordVisible
                          .value,
                  textInputAction:
                      TextInputAction
                          .next,
                  enabled: !isLoading,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                              .value
                          ? Icons
                                .visibility_off_outlined
                          : Icons
                                .visibility_outlined,
                      color: colors
                          .onSurfaceVariant,
                    ),
                    onPressed: () =>
                        passwordVisible
                                .value =
                            !passwordVisible
                                .value,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length <
                        6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height:
                      CaffSpacing.md,
                ),
                // Confirm Password label
                CaffText(
                  text:
                      'Confirm Password',
                  size: CaffFontSize
                      .bodyMd,
                  weight: CaffFontWeight
                      .medium,
                ),
                const SizedBox(
                  height:
                      CaffSpacing.sm,
                ),
                // Confirm Password field
                CaffTextField(
                  controller:
                      confirmPasswordController,
                  hintText:
                      'Confirm your password',
                  obscureText:
                      !confirmPasswordVisible
                          .value,
                  textInputAction:
                      TextInputAction
                          .done,
                  enabled: !isLoading,
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible
                              .value
                          ? Icons
                                .visibility_off_outlined
                          : Icons
                                .visibility_outlined,
                      color: colors
                          .onSurfaceVariant,
                    ),
                    onPressed: () =>
                        confirmPasswordVisible
                                .value =
                            !confirmPasswordVisible
                                .value,
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value !=
                        passwordController
                            .text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      _handleRegister(
                        context,
                        ref,
                        formKey,
                        displayNameController,
                        emailController,
                        passwordController,
                      ),
                ),
                const SizedBox(
                  height:
                      CaffSpacing.xl,
                ),
                // Register button
                CaffPrimaryButton(
                  text:
                      'Create Account →',
                  isLoading: isLoading,
                  onPressed: () =>
                      _handleRegister(
                        context,
                        ref,
                        formKey,
                        displayNameController,
                        emailController,
                        passwordController,
                      ),
                ),
                const SizedBox(
                  height:
                      CaffSpacing.lg,
                ),
                // Navigate back to login
                Center(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                    children: [
                      CaffText(
                        text:
                            'Already have an account? ',
                        size:
                            CaffFontSize
                                .bodyMd,
                        color: colors
                            .onSurfaceVariant,
                      ),
                      GestureDetector(
                        onTap: isLoading
                            ? null
                            : () => context
                                  .pop(),
                        child: CaffText(
                          text: 'Login',
                          size: CaffFontSize
                              .bodyMd,
                          weight: CaffFontWeight
                              .semiBold,
                          color: colors
                              .primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height:
                      CaffSpacing.xl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _handleRegister(
  BuildContext context,
  WidgetRef ref,
  GlobalKey<FormState> formKey,
  TextEditingController
  displayNameController,
  TextEditingController emailController,
  TextEditingController
  passwordController,
) async {
  if (!(formKey.currentState
          ?.validate() ??
      false))
    return;
  final result = await ref
      .read(authActionProvider.notifier)
      .register(
        email: emailController.text
            .trim(),
        password:
            passwordController.text,
        displayName:
            displayNameController.text
                .trim(),
      );
  if (!context.mounted) return;
  if (result is Success) {
    context.go(RouteName.home);
  }
}
