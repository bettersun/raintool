import 'package:dio/dio.dart';

class HttpUtil {
  static Dio? dio;

  static appDio(String apiServer) {
    dio ??= Dio(
      BaseOptions(
        baseUrl: apiServer,
        connectTimeout: 10,
        receiveTimeout: 20,
        sendTimeout: 10,
      ),
    );

    return dio!;
  }
}
