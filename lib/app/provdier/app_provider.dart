import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../../common/const/const.dart';
import '../../common/const/hive_key.dart';
import '../../common/hive_util.dart';
import '../app_service.dart';
import 'app_env.dart';
import 'app_notifier.dart';

final AppService service = KiwiContainer().resolve<AppService>();

final helloWorldProvider = FutureProvider<String>((ref) async {
  return await service.helloWorld();
});

final envProvider = Provider<bool>((ref) {
  return service.checkEnv();
});

final appEnvProvider = StateNotifierProvider<AppEnvNotifier, AppEnv>((ref) {
  String? title = HiveUtil.appBox().get(HiveKey.title);
  title ??= 'Rain tool';

  String? theme = HiveUtil.appBox().get(HiveKey.appTheme);
  theme ??= Const.light;

  String label = '切换到黑暗模式';
  ThemeData? themeData = ThemeData.light();

  // 明亮模式
  if (theme == Const.light) {
    label = '切换到黑暗模式';
    themeData = ThemeData.light();
  }
  // 黑暗模式
  if (theme == Const.dark) {
    label = '切换到明亮模式';
    themeData = ThemeData.dark();
  }
  return AppEnvNotifier(AppEnv(
    title: title,
    label: label,
    theme: theme,
    themeData: themeData,
  ));
});
