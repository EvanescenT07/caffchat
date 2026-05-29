import 'package:caffchat/core/utils/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Secure Storage abstraction with platform configuration
class SecureStorageHelper {
  final _storage =
      const FlutterSecureStorage();
  final IOSOptions _iosOptions;
  final AndroidOptions _androidOptions;

  SecureStorageHelper({
    IOSOptions? iosOptions,
    AndroidOptions? androidOptions,
  }) : _iosOptions =
           iosOptions ??
           const IOSOptions(
             accessibility:
                 KeychainAccessibility
                     .first_unlock,
           ),
       _androidOptions =
           androidOptions ??
           const AndroidOptions(
             encryptedSharedPreferences:
                 true,
           );

  Future<void> write(
    String key,
    String value,
  ) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } on PlatformException catch (e) {
      AppLogger.error(
        'SecureStorage write failed for key: $key',
        error: e,
      );
      rethrow;
    }
  }

  Future<String?> read(
    String key,
  ) async {
    try {
      return await _storage.read(
        key: key,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } on PlatformException catch (e) {
      AppLogger.error(
        'SecureStorage read failed for key: $key',
        error: e,
      );
      rethrow;
    }
  }

  Future<void> delete(
    String key,
  ) async {
    try {
      await _storage.delete(
        key: key,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } on PlatformException catch (e) {
      AppLogger.error(
        'SecureStorage delete failed for key: $key',
        error: e,
      );
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll(
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } on PlatformException catch (e) {
      AppLogger.error(
        'SecureStorage deleteAll failed',
        error: e,
      );
      rethrow;
    }
  }
}
