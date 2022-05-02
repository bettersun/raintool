import 'package:grpc/grpc.dart';

class RpcUtil {
  static ClientChannel? channel;

  static rpcChannel() {
    channel ??= ClientChannel(
      '192.168.3.2',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return channel;
  }

  static shutdowChannel() async {
    if (channel != null) {
      await channel!.shutdown();
    }
  }
}
