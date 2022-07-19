import 'package:dio/dio.dart';

import '../../common/http/http_util.dart';
import '../../common/http/result.dart';
import '../api_hello.dart';
import '../url_const.dart';

class ApiHelloImpl extends ApiHello {
  @override
  Future<Result> hello() async {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.70.12:9527',
      ),
    );
    try {
      final Response response = await dio.get(UrlConst.helloWorld);
      return Result.fromResponse(response);
    } on DioError catch (e) {
      return HttpUtil.resultOnDioError(e);
    }
  }

  @override
  Future<Result> helloParam(String message) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.70.12:9527',
      ),
    );

    Map<String, String> param = {
      'message': message,
    };

    try {
      final Response response = await dio.post(
        UrlConst.helloWorld,
        data: param,
      );
      return Result.fromResponse(response);
    } on DioError catch (e) {
      return HttpUtil.resultOnDioError(e);
    }
  }
}
