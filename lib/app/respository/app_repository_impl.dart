import 'package:basic_utils/basic_utils.dart';

import '../../common/const.dart';
import '../../common/util/hive_util.dart';
import '../../rpc/rpc_hello.dart';
import 'app_repository.dart';

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

  @override
  bool checkEnv() {
    String? apiServer = HiveUtil.appBox().get(HiveKey.apiServer);
    String? rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
    int? rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);

    if (StringUtils.isNullOrEmpty(apiServer) || StringUtils.isNullOrEmpty(rpcServerIp) || rpcServerPort == null) {
      return false;
    }

    return true;
  }
}
