import 'package:kiwi/kiwi.dart';

import 'api/api_hello_world.dart';
import 'api/impl/api_hello_world_impl.dart';
import 'page/app/repository/app_repository.dart';
import 'page/app/repository/app_repository_impl.dart';
import 'page/app/service/app_service.dart';
import 'page/app/service/app_service_impl.dart';
import 'page/tab/repository/tab_repository.dart';
import 'page/tab/repository/tab_repository_impl.dart';
import 'page/tab/service/tab_service.dart';
import 'page/tab/service/tab_service_impl.dart';

part 'kiwi.g.dart';

abstract class Injector {
  @Register.factory(ApiHelloWorld, from: ApiHelloWorldImpl)
  @Register.factory(AppService, from: AppServiceImpl)
  @Register.factory(AppRepository, from: AppRepositoryImpl)
  @Register.factory(TabService, from: TabServiceImpl)
  @Register.factory(TabRepository, from: TabRepositoryImpl)
  void configure();
}

// 注入
void inject() {
  var injector = _$Injector();
  injector.configure();
}
