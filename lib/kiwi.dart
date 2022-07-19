import 'package:kiwi/kiwi.dart';
import 'package:raintool/page/call_api/repository/call_api_repository.dart';
import 'package:raintool/page/call_api/repository/call_api_repository_impl.dart';
import 'package:raintool/page/call_api/service/call_api_service.dart';
import 'package:raintool/page/call_api/service/call_api_service_impl.dart';

import 'api/api_hello.dart';
import 'api/impl/api_hello_impl.dart';
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
  @Register.factory(ApiHello, from: ApiHelloImpl)
  @Register.factory(AppService, from: AppServiceImpl)
  @Register.factory(AppRepository, from: AppRepositoryImpl)
  @Register.factory(TabService, from: TabServiceImpl)
  @Register.factory(TabRepository, from: TabRepositoryImpl)
  @Register.factory(CallApiService, from: CallApiServiceImpl)
  @Register.factory(CallApiRepository, from: CallApiRepositoryImpl)
  void configure();
}

// 注入
void inject() {
  var injector = _$Injector();
  injector.configure();
}
