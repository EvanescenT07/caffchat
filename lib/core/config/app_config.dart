enum Environment { dev, stag, prod }

class AppConfig {
  final Environment env;
  final bool enableChucker;
  final bool enableDebugLogging;

  static late final AppConfig _instance;
  static AppConfig get instance =>
      _instance;

  AppConfig._({
    required this.env,
    required this.enableChucker,
    required this.enableDebugLogging,
  });

  static void init({
    required Environment env,
    required bool enableChucker,
    required bool enableDebugLogging,
  }) {
    _instance = AppConfig._(
      env: env,
      enableChucker: enableChucker,
      enableDebugLogging:
          enableDebugLogging,
    );
  }

  bool get isProduction =>
      env == Environment.prod;
}
