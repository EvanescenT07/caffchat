import 'package:caffchat/core/utils/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_resume.g.dart';

// Manage app resume logic with 5s throttle protection
@Riverpod(keepAlive: true)
class AppResume extends _$AppResume {
  DateTime? _lastValidationTime;
  static const Duration
  _throttleDuration = Duration(
    seconds: 5,
  );

  @override
  void build() {}

  Future<void> onResume() async {
    final now = DateTime.now();

    if (_lastValidationTime != null &&
        now.difference(
              _lastValidationTime!,
            ) <
            _throttleDuration) {
      AppLogger.debug(
        'Resume Throttled - Skipping Validation!',
      );
      return;
    }

    _lastValidationTime = now;
    await _validateUserSession();
  }

  Future<void>
  _validateUserSession() async {
    // TODO: Wire to session verification use case
    AppLogger.info(
      'Session Validation Triggered on Resume',
    );
  }
}
