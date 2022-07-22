import '../common/util.dart';
import 'entity/mock.pbgrpc.dart';

class RpcMock {
  Future<String> startMock(List<String> args) async {
    final stub = MockServiceClient(RpcUtil.channelRpc());

    final name = args.isNotEmpty ? args[0] : '';
    final response = await stub.startMock(
      MockRequest()..name = name,
      // options: CallOptions(compression: const GzipCodec()),
    );

    return response.message;
  }

  Future<String> stopMock(List<String> args) async {
    final stub = MockServiceClient(RpcUtil.channelRpc());

    final name = args.isNotEmpty ? args[0] : '';
    final response = await stub.stopMock(
      MockRequest()..name = name,
      // options: CallOptions(compression: const GzipCodec()),
    );

    return response.message;
  }
}
