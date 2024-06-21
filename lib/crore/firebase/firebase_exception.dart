class FirebaseException implements Exception {
  FirebaseException({required this.message, required this.code});

  final String message;
  final String code;

  @override
  String toString() =>
      'FirebaseServiceException(code: $code, message: $message)';
}
