import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'common/env_util.dart';
import 'common/hive_util.dart';
import 'kiwi.dart';

void main() async {
  // kiwi 依赖注入
  inject();

  // Hive
  await HiveUtil.initBox();
  await HiveUtil.openAppBox();

  // 必须
  await EnvUtil.fetchEnv();

  runApp(const ProviderScope(child: RainApp()));
}
