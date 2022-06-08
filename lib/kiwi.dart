import 'package:kiwi/kiwi.dart';

import 'api/api_get_hello_world.dart';
import 'api/impl/api_get_hello_world_impl.dart';
import 'page/app/respository/app_repository.dart';
import 'page/app/respository/app_repository_impl.dart';
import 'page/app/service/app_service.dart';
import 'page/app/service/app_service_impl.dart';

part 'kiwi.g.dart';

abstract class Injector {
  @Register.factory(AppService, from: AppServiceImpl)
  @Register.factory(AppRepository, from: AppRepositoryImpl)
  @Register.factory(ApiGetHelloWorld, from: ApiGetHelloWorldImpl)
  void configure();
}

// 注入
void inject() {
  var injector = _$Injector();
  injector.configure();
}
