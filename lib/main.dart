import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'page/app/app.dart';
import 'common/i18n/strings.g.dart';
import 'common/util.dart';
import 'kiwi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  // kiwi 依赖注入
  inject();

  // Hive
  await HiveUtil.initBox();
  await HiveUtil.openAppBox();

  // HiveUtil.appBox().put(HiveKey.appLocale, 'zh-CN');

  // 必需
  await EnvUtil.loadEnv();

  runApp(
    const ProviderScope(
      child: RainApp(),
    ),
  );
}
