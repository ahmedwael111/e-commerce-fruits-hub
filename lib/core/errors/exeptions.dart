class CoustomException implements Exception {
  final String message;

  CoustomException({required this.message});

  @override
  String toString() => 'CustomException: $message';
}