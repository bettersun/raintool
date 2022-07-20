import 'package:raintool/common/const/biz_code.dart';

import '../http/http_const.dart';

abstract class CommonView {
  final int statusCode;
  final String bizCode;
  final String message;

  const CommonView({
    this.statusCode = HttpConst.unknownError,
    this.bizCode = BizCode.e9001,
    this.message = '',
  });
}
