import '../common/util.dart';
import 'entity/hello.pbgrpc.dart';

class RpcHello {
  Future<String> hello(List<String> args) async {
    final stub = RainServiceClient(RpcUtil.channelRpc());

    final name = args.isNotEmpty ? args[0] : '';
    final response = await stub.hello(
      HelloRequest()..name = name,
      // options: CallOptions(compression: const GzipCodec()),
    );

    return response.message;
  }
}
