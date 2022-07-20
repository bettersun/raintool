import '../common/http/http_util.dart';
import '../common/http/result.dart';
import 'api_const.dart';
import 'api_hello.dart';

class ApiHelloImpl extends ApiHello {
  @override
  Future<Result> hello() async {
    Map<String, String> param = {
      'message': 'hello get',
    };

    return await HttpUtil.doGet(ApiConst.hello, param);
  }

  @override
  Future<Result> helloParam(String message) async {
    Map<String, String> param = {
      'message': message,
    };

    return await HttpUtil.doPost(ApiConst.hello, param);
  }
}
