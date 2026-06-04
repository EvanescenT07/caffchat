import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/router/app_router.dart';
import 'package:caffchat/presentation/providers/auth/auth_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen
    extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final colors = CaffColor.of(
      context,
    );

    final animationController =
        useAnimationController(
          duration: const Duration(
            milliseconds: 1200,
          ),
        );

    final fadeAnimation = useMemoized(
      () => CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
      [animationController],
    );
    useEffect(() {
      void onComplete(
        AnimationStatus status,
      ) {
        if (status ==
            AnimationStatus.completed) {
          final isAuthenticated = ref
              .read(authStateProvider);
          AppRouter.completeSplash(
            isAuthenticated:
                isAuthenticated,
          );
        }
      }

      animationController
          .addStatusListener(
            onComplete,
          );
      animationController.forward();
      return () {
        animationController
            .removeStatusListener(
              onComplete,
            );
        fadeAnimation.dispose();
      };
    }, [animationController]);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.primaryContainer
                  .withValues(
                    alpha: 0.1,
                  ),
              colors.primaryContainer,
              colors.primaryContainer
                  .withValues(
                    alpha: 0.1,
                  ),
            ],
            stops: const [
              0.0,
              0.5,
              1.0,
            ],
          ),
        ),
        child: FadeTransition(
          opacity: fadeAnimation,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment
                    .center,
            children: [
              // App icon with glass-like container
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: colors
                      .onPrimary
                      .withValues(
                        alpha: 0.08,
                      ),
                  borderRadius:
                      BorderRadius.circular(
                        28,
                      ),
                  border: Border.all(
                    color: colors
                        .onPrimary
                        .withValues(
                          alpha: 0.08,
                        ),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colors
                          .primaryContainer
                          .withValues(
                            alpha: 0.01,
                          ),
                      blurRadius: 24,
                      offset:
                          const Offset(
                            0,
                            8,
                          ),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                        24,
                      ),
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CaffText(
                text: 'CaffChat',
                size: CaffFontSize
                    .headlineMd,
                weight: CaffFontWeight
                    .black,
                color: colors
                    .onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
