import 'package:caffchat/presentation/pages/home/homepage.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router =
      GoRouter(
        navigatorKey:
            ChuckerFlutter.navigatorKey,
        initialLocation: '/',
        debugLogDiagnostics: true,
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) {
              return const Homepage();
            },
          ),
        ],
      );
}
