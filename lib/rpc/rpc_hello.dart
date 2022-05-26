import '../_grpc/hello.pbgrpc.dart';
import '../common/util.dart';

class RpcHello {
  Future<String> hello(List<String> args) async {
    final stub = GreeterClient(RpcUtil.channelRpc());

    final name = args.isNotEmpty ? args[0] : 'world';
    final response = await stub.sayHello(
      HelloRequest()..name = name,
      // options: CallOptions(compression: const GzipCodec()),
    );

    return response.message;
  }
}
