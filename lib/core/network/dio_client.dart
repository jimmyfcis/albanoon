import 'package:dio/dio.dart';
import '../storage/token_storage.dart';
import 'app_interceptor.dart';
import 'dio_logger_interceptor.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio();
    dio.interceptors.add(AppInterceptors(tokenStorage: TokenStorage()));
    dio.interceptors.add(DioLoggerInterceptor());  // Make sure the interceptor is added here
  }
}
