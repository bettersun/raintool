import 'package:dio/dio.dart';

import '../api_get_hello_world.dart';

class ApiGetHelloWorldImpl extends ApiGetHelloWorld {
  //
  @override
  Future<String> helloWorld() async {
    Response response;
    var dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.3.2:9527',
      ),
    );
    response = await dio.get('/helloworld');
    return response.data;
  }
}
