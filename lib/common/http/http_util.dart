import 'dart:io';

import 'package:dio/dio.dart';

import 'http_status_ext.dart';
import 'result.dart';

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

  static Result resultOnDioError(DioError e) {
    int statusCode = HttpStatusExt.unknownError;
    if (e.response != null) {
      statusCode = e.response!.statusCode ?? HttpStatusExt.unknownError;
    }

    String message = '';
    switch (e.type) {
      case DioErrorType.connectTimeout:
        message = 'connectTimeout';
        break;
      case DioErrorType.cancel:
        message = 'cancel';
        break;
      case DioErrorType.sendTimeout:
        message = 'sendTimeout';
        break;
      case DioErrorType.receiveTimeout:
        message = 'receiveTimeout';
        break;
      case DioErrorType.response:
        message = 'response error';
        break;
      case DioErrorType.other:
      default:
        message = 'other error';
        break;
    }

    return Result(statusCode: statusCode, message: message);
  }

  static bool isOk(int? statusCode) {
    return statusCode == HttpStatus.ok || statusCode == HttpStatus.created || statusCode == HttpStatus.noContent;
  }
}
