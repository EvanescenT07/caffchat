// Spesific exception class for data layer
class ServerException
    implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() =>
      'ServerException $statusCode: $message';
}

class CacheException
    implements Exception {
  final String message;

  const CacheException({
    required this.message,
  });

  @override
  String toString() =>
      'CacheException: $message';
}
