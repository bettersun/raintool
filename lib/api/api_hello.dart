import '../common/http/result.dart';

abstract class ApiHello {
  ///
  Future<Result> hello();

  ///
  Future<Result> helloParam(String message);
}
