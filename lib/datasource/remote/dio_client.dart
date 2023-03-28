import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient with DioMixin implements Dio {
  DioClient({String baseUrl = ''}) {
    httpClientAdapter = IOHttpClientAdapter();

    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );

    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );
  }
}
