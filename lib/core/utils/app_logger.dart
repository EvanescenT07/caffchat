import 'package:caffchat/core/config/app_config.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat
          .onlyTimeAndSinceStart,
    ),
  );

  AppLogger._();

  static void debug(String message) {
    if (AppConfig
        .instance
        .enableDebugLogging) {
      _logger.d(message);
    }
  }

  static void info(String message) {
    if (AppConfig
        .instance
        .enableDebugLogging) {
      _logger.i(message);
    }
  }

  static void warning(String message) {
    if (AppConfig
        .instance
        .enableDebugLogging) {
      _logger.w(message);
    }
  }

  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) => _logger.e(
    message,
    error: error,
    stackTrace: stackTrace,
  );
}
