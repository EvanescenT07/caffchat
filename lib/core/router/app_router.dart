import 'package:caffchat/core/config/app_config.dart';
import 'package:caffchat/core/router/app_route_name.dart';
import 'package:caffchat/presentation/pages/auth/login.dart';
import 'package:caffchat/presentation/pages/auth/register.dart';
import 'package:caffchat/presentation/pages/chat/chatroom_page.dart';
import 'package:caffchat/presentation/pages/home/homepage.dart';
import 'package:caffchat/presentation/pages/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  // Track splash delay
  static bool _splashCompleted = false;

  // Lazy singleton
  static GoRouter? _router;

  static void completeSplash({
    required bool isAuthenticated,
  }) {
    _splashCompleted = true;
    _router?.go(
      isAuthenticated
          ? RouteName.home
          : RouteName.login,
    );
  }

  static GoRouter get router {
    return _router ??= GoRouter(
      initialLocation: RouteName.splash,
      debugLogDiagnostics: AppConfig
          .instance
          .enableDebugLogging,
      redirect: (context, state) {
        final isSplash =
            state.matchedLocation ==
            RouteName.splash;

        // While splash hasn't completed, force stay on splash
        if (!_splashCompleted &&
            !isSplash) {
          return RouteName.splash;
        }

        // After splash, never go back to splash
        if (_splashCompleted &&
            isSplash) {
          final isLoggedIn =
              FirebaseAuth
                  .instance
                  .currentUser !=
              null;
          return isLoggedIn
              ? RouteName.home
              : RouteName.login;
        }

        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteName.splash,
          name: RouteName.splash,
          builder: (context, state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: RouteName.home,
          name: RouteName.home,
          builder: (context, state) =>
              const Homepage(),
        ),
        GoRoute(
          path: RouteName.login,
          name: RouteName.login,
          builder: (context, state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: RouteName.register,
          name: RouteName.register,
          builder: (context, state) =>
              const RegisterPage(),
        ),

        // Chat room with conversationId params
        GoRoute(
          path:
              '${RouteName.chatRoom}/:conversationId',
          name: RouteName.chatRoom,
          builder: (context, state) =>
              ChatRoomPage(
                conversationId: state
                    .pathParameters['conversationId']!,
              ),
        ),
      ],
    );
  }
}
