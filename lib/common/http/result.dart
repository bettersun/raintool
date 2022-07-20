import 'package:dio/dio.dart';

import 'http_const.dart';

class Result {
  final int statusCode;
  final String message;
  final dynamic data;

  Result({
    this.statusCode = HttpConst.unknownError,
    this.message = '',
    this.data,
  });

  factory Result.fromResponse(Response response) {
    return Result(
      statusCode: response.statusCode ?? HttpConst.unknownError,
      message: response.statusMessage ?? '',
      data: response.data,
    );
  }
}
