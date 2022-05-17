import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../../_i18n/strings.g.dart';
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

// 主题 Provider
final themeProvider = Provider<ThemeData>((ref) {
  final appEnv = ref.watch(appEnvProvider);

  ThemeData themeData = ThemeData.light();
  // 明亮模式
  if (appEnv.theme == Const.light) {
    themeData = ThemeData.light();
  }
  // 黑暗模式
  if (appEnv.theme == Const.dark) {
    themeData = ThemeData.dark();
  }

  return themeData;
});

// 应用配置 Provider
final appEnvProvider = StateNotifierProvider<AppEnvNotifier, AppEnv>((ref) {
  // 应用标题
  String? title = HiveUtil.appBox().get(HiveKey.title);
  title ??= Const.defaultTitle;

  // 主题标志
  String? theme = HiveUtil.appBox().get(HiveKey.appTheme);
  theme ??= Const.light;

  // 主题切换标签
  String label = Const.labelDark;

  // 明亮模式
  if (theme == Const.light) {
    label = Const.labelDark;
  }
  // 黑暗模式
  if (theme == Const.dark) {
    label = Const.labelLight;
  }

  // 国际化
  String? locale = HiveUtil.appBox().get(HiveKey.appLocale);
  locale ??= Const.localDefault;

  // 持久化
  LocaleSettings.setLocaleRaw(locale);

  return AppEnvNotifier(AppEnv(
    title: title,
    label: label,
    theme: theme,
    locale: locale,
  ));
});
