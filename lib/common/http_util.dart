import 'package:dio/dio.dart';

class HttpUtil {
  static Dio? dio;

  static appDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: 'http://192.168.3.2:9527',
        connectTimeout: 10,
        receiveTimeout: 20,
        sendTimeout: 10,
      ),
    );

    return dio!;
  }
}
