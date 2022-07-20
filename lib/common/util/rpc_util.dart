import 'package:grpc/grpc.dart';

import '../const.dart';
import 'hive_util.dart';

class RpcUtil {
  static ClientChannel? channel;

  /// 获取 RPC 通道（单例）
  static channelRpc() {
    if (channel == null) {
      String rpcServer = HiveUtil.appBox().get(HiveKey.rpcServer);
      int rpcPort = HiveUtil.appBox().get(HiveKey.rpcPort);

      channel = ClientChannel(
        rpcServer,
        port: rpcPort,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      );
    }

    return channel;
  }

  /// 设置 RPC 通道（单例）
  static setChannel(String rpcServer, int rpcPort) {
    HiveUtil.appBox().put(HiveKey.rpcServer, rpcServer);
    HiveUtil.appBox().put(HiveKey.rpcPort, rpcPort);

    channel = ClientChannel(
      rpcServer,
      port: rpcPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  /// 关闭 RPC 通道
  static shutdownChannel() async {
    if (channel != null) {
      await channel!.shutdown();
    }
  }
}
