import 'dart:convert';
import 'package:dio/dio.dart';

class DioLoggerInterceptor extends Interceptor {
  void _printPrettyJson(dynamic data) {
    const encoder = JsonEncoder.withIndent('  ');
    final prettyJson = encoder.convert(data);
    print(prettyJson); // This ensures the pretty JSON is printed to the console.
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("=================== API REQUEST ===================");
    print("METHOD: ${options.method}");
    print("URL: ${options.uri}");
    print("HEADERS:");
    _printPrettyJson(options.headers);
    if (options.data != null) {
      print("BODY:");
      try {
        _printPrettyJson(options.data);
      } catch (e) {
        print("RAW BODY: ${options.data.toString()}");
      }
    }
    print("====================================================");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("=================== API RESPONSE ===================");
    print("STATUS CODE: ${response.statusCode}");
    print("URL: ${response.requestOptions.uri}");
    if (response.data != null) {
      print("RESPONSE BODY:");
      try {
        _printPrettyJson(response.data);
      } catch (e) {
        print("RAW RESPONSE: ${response.data.toString()}");
      }
    }
    print("====================================================");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("=================== API ERROR =====================");
    print("URL: ${err.requestOptions.uri}");
    print("MESSAGE: ${err.message}");
    if (err.response != null && err.response?.data != null) {
      print("ERROR RESPONSE:");
      try {
        _printPrettyJson(err.response?.data);
      } catch (e) {
        print("RAW ERROR RESPONSE: ${err.response?.data.toString()}");
      }
    }
    print("====================================================");
    super.onError(err, handler);
  }
}
