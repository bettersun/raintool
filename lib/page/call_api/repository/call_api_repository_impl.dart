import 'package:kiwi/kiwi.dart';

import '../../../api/api_hello.dart';
import '../../../common/http/result.dart';
import '../../../common/util.dart';
import '../entity/entity.dart';
import 'call_api_repository.dart';

class CallApiRepositoryImpl extends CallApiRepository {
  final ApiHello api = KiwiContainer().resolve<ApiHello>();

  @override
  Future<CallApiView> hello(CallApiView view) async {
    Result result = await api.hello();

    // 2xx 以外
    if (!HttpUtil.isOk(result.statusCode)) {
      return view.copyWith(
        statusCode: result.statusCode,
        message: result.message,
      );
    }

    return CallApiView(
      statusCode: result.statusCode,
      message: result.message,
      helloInfo: result.data == null ? const HelloInfo() : HelloInfo.fromJson(result.data),
    );
  }

  @override
  Future<CallApiView> helloParam(CallApiView view, CallApiParam param) async {
    Result result = await api.helloParam(param.param);

    // 2xx 以外
    if (!HttpUtil.isOk(result.statusCode)) {
      return view.copyWith(
        statusCode: result.statusCode,
        message: result.message,
      );
    }

    return CallApiView(
      statusCode: result.statusCode,
      message: result.message,
      helloInfo: result.data == null ? const HelloInfo() : HelloInfo.fromJson(result.data),
    );
  }
//
}
