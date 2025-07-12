abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure(String message,int statusCode) : super(message: message,statusCode:statusCode );
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message: message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message: message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message: message);
}
