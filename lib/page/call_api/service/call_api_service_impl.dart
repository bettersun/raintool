import 'package:kiwi/kiwi.dart';

import '../entity/entity.dart';
import '../repository/call_api_repository.dart';
import 'call_api_service.dart';

class CallApiServiceImpl extends CallApiService {
  final CallApiRepository repo = KiwiContainer().resolve<CallApiRepository>();

  @override
  Future<CallApiView> hello(CallApiView view) async {
    final CallApiView newView = await repo.hello(view);
    return newView;
  }

  @override
  Future<CallApiView> helloParam(CallApiView view, CallApiParam param) async {
    final CallApiView newView = await repo.helloParam(view, param);
    return newView;
  }
}
