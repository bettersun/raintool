import 'package:grpc/grpc.dart';

import '../const.dart';
import 'hive_util.dart';

class RpcUtil {
  static ClientChannel? channel;

  static channelRpc() {
    if (channel == null) {
      String rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
      int rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);

      channel = ClientChannel(
        rpcServerIp,
        port: rpcServerPort,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
    }

    return channel;
  }

  static setChannel(String rpcServerIp, int rpcServerPort) {
    channel = ClientChannel(
      rpcServerIp,
      port: rpcServerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  static shutdownChannel() async {
    if (channel != null) {
      await channel!.shutdown();
    }
  }
}
