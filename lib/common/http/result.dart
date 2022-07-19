import 'package:dio/dio.dart';

import 'http_status_ext.dart';

class Result {
  final int statusCode;
  final String message;
  final dynamic data;

  Result({
    this.statusCode = HttpStatusExt.unknownError,
    this.message = '',
    this.data,
  });

  factory Result.fromResponse(Response response) {
    return Result(
      statusCode: response.statusCode ?? HttpStatusExt.unknownError,
      message: response.statusMessage ?? '',
      data: response.data,
    );
  }
}
