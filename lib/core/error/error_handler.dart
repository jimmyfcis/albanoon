import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error,[StackTrace? stackTrace]) {
    print(error.toString());
    print(stackTrace);
    if (error is DioException) {
      final statusCode = error.response?.statusCode ?? 0;
      final responseData = error.response?.data;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return NetworkFailure("Connection timed out. Please try again.");

        case DioExceptionType.badResponse:
        // Try to parse error message from response body
          if (responseData is Map<String, dynamic> &&
              (responseData['error'] != null || responseData['errors'] != null)) {
            if (responseData['errors'] is Map<String, dynamic>) {
              final errorsMap = responseData['errors'] as Map<String, dynamic>;
              for (final entry in errorsMap.entries) {
                final messages = entry.value;
                if (messages is List && messages.isNotEmpty) {
                  return ServerFailure(messages.first.toString(), statusCode);
                }
              }
            }
            else {
              return ServerFailure(responseData['error'].toString(), statusCode);
            }
          }
          // If error message is set manually (e.g. from Interceptor)
          if (error.error is String && (error.error as String).isNotEmpty) {
            return ServerFailure(error.error as String,statusCode);
          }

          return ServerFailure("Something went wrong (status code $statusCode)",statusCode);

        case DioExceptionType.connectionError:
          return NetworkFailure("No internet connection.");

        case DioExceptionType.cancel:
          return NetworkFailure("Request cancelled.");

        default:
          if (error.error is String) {
            return UnknownFailure(error.error as String);
          }
          return UnknownFailure("Unexpected error occurred.");
      }
    } else if (error is FormatException) {
      return ValidationFailure("Bad response format.");
    } else {
      return UnknownFailure("Something went wrong. Please try again.");
    }
  }
}
