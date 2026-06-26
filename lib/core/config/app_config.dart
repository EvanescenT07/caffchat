enum Environment { dev, stag, prod }

class AppConfig {
  final Environment env;
  final bool enableDebugLogging;

  static late final AppConfig _instance;
  static AppConfig get instance => _instance;

  AppConfig._({
    required this.env,
    required this.enableDebugLogging,
  });

  static void init({
    required Environment env,
    required bool enableDebugLogging,
  }) {
    _instance = AppConfig._(
      env: env,
      enableDebugLogging: enableDebugLogging,
    );
  }

  bool get isProduction => env == Environment.prod;
}
