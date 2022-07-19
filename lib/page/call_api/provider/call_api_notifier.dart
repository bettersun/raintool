import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/entity.dart';
import '../service/call_api_service.dart';

class CallApiNotifier extends StateNotifier<CallApiView> {
  CallApiNotifier(CallApiView? state) : super(state ?? const CallApiView());

  final CallApiService service = KiwiContainer().resolve<CallApiService>();

  ///
  void hello() async {
    state = await service.hello(state);
  }

  ///
  void helloParam(String message) async {
    CallApiParam param = CallApiParam(param: message);
    state = await service.helloParam(state, param);
  }
}
