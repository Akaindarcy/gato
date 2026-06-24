class AppException implements Exception {
  final String message;
  final dynamic cause;
  const AppException(this.message, {this.cause});

  @override
  String toString() {
    if (cause != null) return 'AppException: $message\nCaused by: $cause';
    return 'AppException: $message';
  }
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.cause});
}

class CacheException extends AppException {
  const CacheException(super.message, {super.cause});
}

class AuthException extends AppException {
  const AuthException(super.message, {super.cause});
}

class SyncException extends AppException {
  const SyncException(super.message, {super.cause});
}
