import 'package:caffchat/app_bootstrap.dart';
import 'package:caffchat/core/config/app_config.dart';

Future<void> main() async {
  AppConfig.init(
    env: Environment.dev,
    enableChucker: true,
    enableDebugLogging: true,
  );

  await bootstrap();
}
