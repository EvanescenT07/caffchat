// Centralized route path constant
// Usage: context.go(RouteName.home)
// To add a new route:
//   1. Add the path constant here
//   2. Add the GoRoute in app_router.dart

class RouteName {
  RouteName._();

  // Splash
  static const String splash =
      '/splash';

  // Authentication
  static const String login = '/login';
  static const String register =
      '/register';

  // Main
  static const String home = '/home';

  // Chat
  static const String chatRoom =
      '/chat-room';

  // Settings
  static const String editProfile =
      '/edit-profile';
  static const String changePassword =
      '/change-password';
}
