import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'common/hive_util.dart';
import 'kiwi.dart';

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

  // HiveUtil.appBox().put(Constant.title, 'Hello~World~');

  // kiwi
  inject();

  runApp(const ProviderScope(child: RainApp()));
}
