import 'package:raintool/app/app_repository.dart';

import '../../api/rpc_hello.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  Future<String> helloWorld() async {
    // final ApiGetHelloWorld api = KiwiContainer().resolve<ApiGetHelloWorld>();
    // String s = await api.helloWorld();
    //
    // return s;

    String s = await RpcHello().hello(["BS"]);

    return s;
  }
}
