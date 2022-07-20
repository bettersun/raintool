import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../const.dart';
import '../util/hive_util.dart';
import 'http_const.dart';
import 'result.dart';

class HttpUtil {
  static Dio? dio;

  /// dio 单例
  static appDio() {
    if (dio == null) {
      String apiHost = HiveUtil.appBox().get(HiveKey.apiHost);

      dio = Dio(
        BaseOptions(
          baseUrl: apiHost,
          connectTimeout: AppConst.defaultConnectTimeout,
          receiveTimeout: AppConst.defaultReceiveTimeout,
          sendTimeout: AppConst.defaultSendTimeout,
        ),
      );
    }

    return dio!;
  }

  /// Get 请求
  static Future<Result> doGet(String url, Map<String, dynamic> param) async {
    try {
      final Response response = await appDio().get(url, queryParameters: param);
      return Result.fromResponse(response);
    } on DioError catch (e) {
      return HttpUtil.resultOnDioError(e);
    } on Error catch (e) {
      return Result(statusCode: HttpConst.unknownError, message: e.stackTrace!.toString());
    }
  }

  /// Post 请求
  static Future<Result> doPost(String url, Map<String, dynamic> param) async {
    final jsonData = json.encode(param);

    try {
      final Response response = await appDio().post(
        url,
        data: jsonData,
      );

      return Result.fromResponse(response);
    } on DioError catch (e) {
      return HttpUtil.resultOnDioError(e);
    } on Error catch (e) {
      return Result(statusCode: HttpConst.unknownError, message: e.stackTrace!.toString());
    }
  }

  /// 错误时Result
  static Result resultOnDioError(DioError e) {
    int statusCode = HttpConst.unknownError;
    if (e.response != null) {
      statusCode = e.response!.statusCode ?? HttpConst.unknownError;
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
        message = 'other error';
        if (e.error is SocketException) {
          message = e.error.toString();
        }
        if (e.error is WebSocketException) {
          message = e.error.toString();
        }
        break;
      default:
        message = 'unknown error';
        break;
    }

    return Result(statusCode: statusCode, message: message);
  }

  /// 响应正常：响应状态码为2xx
  static bool isOk(int statusCode) {
    return statusCode / 100 == 2;
  }
}
