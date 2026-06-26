import 'package:caffchat/core/design/caff_color.dart';
import 'package:caffchat/core/design/caff_text.dart';
import 'package:caffchat/core/design/font_config/caff_font_size.dart';
import 'package:caffchat/core/design/font_config/caff_font_weight.dart';
import 'package:caffchat/core/router/app_router.dart';
import 'package:caffchat/presentation/providers/auth/auth_repository_provider.dart';
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
   
    final animationController =
        useAnimationController(
          duration: const Duration(
            milliseconds: 3200,
          ),
        );

    final fadeInAnimation = useMemoized(
      () =>
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent:
                  animationController,
              curve: const Interval(
                0.0,
                0.375,
                curve: Curves.easeIn,
              ),
            ),
          ),
      [animationController],
    );

    final fadeOutAnimation = useMemoized(
      () =>
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(
            CurvedAnimation(
              parent:
                  animationController,
              curve: const Interval(
                0.6875,
                1.0,
                curve: Curves.easeOut,
              ),
            ),
          ),
      [animationController],
    );

    final scaleAnimation = useMemoized(
      () =>
          Tween<double>(
            begin: 0.85,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent:
                  animationController,
              curve: const Interval(
                0.0,
                0.375,
                curve:
                    Curves.easeOutCubic,
              ),
            ),
          ),
      [animationController],
    );

    useEffect(() {
      void onComplete(
        AnimationStatus status,
      ) async {
        if (status ==
            AnimationStatus.completed) {
          // Validate session against Firebase server
          // This catches disabled/deleted accounts
          final repository = ref.read(
            authRepositoryProvider,
          );
          final isSessionValid =
              await repository
                  .validateSession();
          AppRouter.completeSplash(
            isAuthenticated:
                isSessionValid,
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
              context.colors.primaryContainer
                  .withValues(
                    alpha: 0.1,
                  ),
              context.colors.primaryContainer,
              context.colors.primaryContainer
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
        child: AnimatedBuilder(
          animation:
              animationController,
          builder: (context, child) {
            final opacity =
                (fadeInAnimation.value *
                        fadeOutAnimation
                            .value)
                    .clamp(0.0, 1.0);

            return Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: scaleAnimation
                    .value,
                child: child,
              ),
            );
          },
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
                  color: context.colors
                      .onPrimary
                      .withValues(
                        alpha: 0.08,
                      ),
                  borderRadius:
                      BorderRadius.circular(
                        28,
                      ),
                  border: Border.all(
                    color: context.colors
                        .onPrimary
                        .withValues(
                          alpha: 0.08,
                        ),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors
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
                color: context.colors
                    .onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
