import '../entity/entity.dart';

abstract class CallApiService {
  /// Hello
  Future<CallApiView> hello(CallApiView view);

  /// Hello Param
  Future<CallApiView> helloParam(CallApiView view, CallApiParam param);
}
