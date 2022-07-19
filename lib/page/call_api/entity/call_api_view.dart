import '../../../common/entity/common_view.dart';
import 'hello_info.dart';

class CallApiView extends CommonView {
  final HelloInfo helloInfo;

  const CallApiView({super.statusCode, super.data, super.message, this.helloInfo = const HelloInfo()});

  CallApiView copyWith({
    int? statusCode,
    String? message,
    HelloInfo? helloInfo,
  }) {
    return CallApiView(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      helloInfo: helloInfo ?? this.helloInfo,
    );
  }
}
