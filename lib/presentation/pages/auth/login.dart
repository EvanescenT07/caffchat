import 'package:caffchat/core/design/caff_color.dart';
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

class LoginPage
    extends HookConsumerWidget {
  const LoginPage({super.key});

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
    final emailController =
        useTextEditingController();
    final passwordController =
        useTextEditingController();
    final passwordVisible = useState(
      false,
    );
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(
                  horizontal:
                      CaffSpacing.lg,
                ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  // App Icon
                  Container(
                    width: 80,
                    height: 80,
                    decoration:
                        BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                        ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        fit: BoxFit
                            .contain,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height:
                        CaffSpacing.lg,
                  ),

                  // App Name
                  CaffText(
                    text: 'CaffChat',
                    size: CaffFontSize
                        .headlineMd,
                    weight:
                        CaffFontWeight
                            .bold,
                    color: colors
                        .primaryContainer,
                  ),

                  const SizedBox(
                    height:
                        CaffSpacing.xl,
                  ),

                  // Email Field
                  CaffTextField(
                    controller:
                        emailController,
                    hintText: 'Email',
                    keyboardType:
                        TextInputType
                            .emailAddress,
                    textInputAction:
                        TextInputAction
                            .next,
                    enabled: !isLoading,
                    validator: (value) {
                      if (value ==
                              null ||
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

                  // Password field
                  CaffTextField(
                    controller:
                        passwordController,
                    hintText:
                        'Password',
                    obscureText:
                        !passwordVisible
                            .value,
                    textInputAction:
                        TextInputAction
                            .done,
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
                      if (value ==
                              null ||
                          value
                              .isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length <
                          6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onFieldSubmitted:
                        (
                          _,
                        ) => _handleLogin(
                          context,
                          ref,
                          formKey,
                          emailController,
                          passwordController,
                        ),
                  ),
                  const SizedBox(
                    height:
                        CaffSpacing.lg,
                  ),
                  // Login button
                  CaffPrimaryButton(
                    text: 'Login',
                    isLoading:
                        isLoading,
                    onPressed: () =>
                        _handleLogin(
                          context,
                          ref,
                          formKey,
                          emailController,
                          passwordController,
                        ),
                  ),
                  const SizedBox(
                    height:
                        CaffSpacing.md,
                  ),
                  // Forgot password
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () =>
                              _showForgotPasswordDialog(
                                context,
                                ref,
                              ),
                    child: CaffText(
                      text:
                          'Forgot password?',
                      size: CaffFontSize
                          .bodyMd,
                      color: colors
                          .onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(
                    height:
                        CaffSpacing.xl,
                  ),
                  // Navigate to register
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                    children: [
                      CaffText(
                        text:
                            "Don't have an account? ",
                        size:
                            CaffFontSize
                                .bodyMd,
                        color: colors
                            .onSurfaceVariant,
                      ),
                      GestureDetector(
                        onTap: isLoading
                            ? null
                            : () => context.pushNamed(
                                RouteName
                                    .register,
                              ),
                        child: CaffText(
                          text:
                              'Register',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _handleLogin(
  BuildContext context,
  WidgetRef ref,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController
  passwordController,
) async {
  if (!(formKey.currentState
          ?.validate() ??
      false)) {
    return;
  }
  final result = await ref
      .read(authActionProvider.notifier)
      .signIn(
        email: emailController.text
            .trim(),
        password:
            passwordController.text,
      );
  if (!context.mounted) return;
  if (result is Success) {
    context.go(RouteName.home);
  }
}

void _showForgotPasswordDialog(
  BuildContext context,
  WidgetRef ref,
) {
  final forgotEmailController =
      TextEditingController();
  final colors = Theme.of(
    context,
  ).colorScheme;
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text(
        'Reset Password',
      ),
      content: TextField(
        controller:
            forgotEmailController,
        keyboardType:
            TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText:
              'Enter your email address',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(
            dialogContext,
          ).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: colors
                  .onSurfaceVariant,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            final email =
                forgotEmailController
                    .text
                    .trim();
            if (email.isEmpty) return;
            Navigator.of(
              dialogContext,
            ).pop();
            await ref
                .read(
                  authActionProvider
                      .notifier,
                )
                .forgotPassword(
                  email: email,
                );
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    'If an account exists with that email, a reset link has been sent.',
                  ),
                ),
              );
            }
          },
          child: Text(
            'Send',
            style: TextStyle(
              color: colors.primary,
            ),
          ),
        ),
      ],
    ),
  );
}
