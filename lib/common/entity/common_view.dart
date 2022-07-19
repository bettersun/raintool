import 'package:raintool/common/http/http_status_ext.dart';

abstract class CommonView {
  final int statusCode;
  final String message;
  final dynamic data;

  const CommonView({this.statusCode = HttpStatusExt.unknownError, this.message = '', this.data});
}
