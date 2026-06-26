import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_version_provider.g.dart';

/// Reads app version from native platform config.
/// Auto-syncs with pubspec.yaml version — no manual update needed.

@riverpod
Future<String> appVersion(
  Ref ref,
) async {
  final app =
      await PackageInfo.fromPlatform();
  return app.version;
}
  