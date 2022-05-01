import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';
import 'package:raintool/api/api_get_hello_world.dart';
import 'package:raintool/api/impl/api_get_hello_world_impl.dart';
import 'package:raintool/app/app_repository.dart';
import 'package:raintool/app/impl/app_service_impl.dart';

import 'app/app.dart';
import 'app/app_service.dart';
import 'app/impl/app_repository_impl.dart';
import 'common/constant.dart';
import 'common/hive_util.dart';

// void main() {
//   runApp(
//     // 为了使组件能读取 provider ，我们需要将整个应用包装在一个 "ProviderScope" 组件中。
//     // 这是 provider 的状态要存储的地方。
//     const ProviderScope(
//       child: App(),
//     ),
//   );
// }

void main() async {
  // Hive
  await HiveUtil.initBox();
  await HiveUtil.openAppBox();

  HiveUtil.appBox().put(Constant.title, 'Hello~World~');

  // Kiwi
  KiwiContainer container = KiwiContainer();
  container.registerInstance<AppService>(AppServiceImpl());
  container.registerInstance<AppRepository>(AppRepositoryImpl());
  container.registerInstance<ApiGetHelloWorld>(ApiGetHelloWorldImpl());

  runApp(const ProviderScope(child: RainApp()));
}
