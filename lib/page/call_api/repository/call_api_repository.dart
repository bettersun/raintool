import '../entity/entity.dart';

abstract class CallApiRepository {
  /// hello
  Future<CallApiView> hello(CallApiView view);

  /// Hello Param
  Future<CallApiView> helloParam(CallApiView view, CallApiParam param);
}
