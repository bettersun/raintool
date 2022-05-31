import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../../common/const.dart';
import '../../common/i18n/strings.g.dart';
import '../../common/util.dart';
import '../service/app_service.dart';
import '../entity/app_env.dart';
import 'app_env_notifier.dart';
import '../entity/app_setting.dart';
import 'app_setting_notifier.dart';

final AppService _appService = KiwiContainer().resolve<AppService>();

final helloWorldProvider = FutureProvider<String>((ref) async {
  return await _appService.helloWorld();
});

// // 主题 Provider
// final themeProvider = Provider<ThemeData>((ref) {
//   final appEnv = ref.watch(appEnvProvider);
//
//   ThemeData themeData = ThemeData.light();
//   // 明亮模式
//   if (appEnv.theme == AppConst.light) {
//     themeData = ThemeData.light();
//   }
//   // 黑暗模式
//   if (appEnv.theme == AppConst.dark) {
//     themeData = ThemeData.dark();
//   }
//
//   return themeData;
// });

// 应用配置 Provider
final appEnvProvider = StateNotifierProvider<AppEnvNotifier, AppEnv>((ref) {
  // 应用标题
  String? title = HiveUtil.appBox().get(HiveKey.title);
  title ??= AppConst.defaultTitle;

  // 主题标志
  String? theme = HiveUtil.appBox().get(HiveKey.appTheme);
  theme ??= AppConst.light;

  // 主题切换标签
  String label = AppConst.labelDark;

  ThemeData themeData = ThemeData.light();

  // 明亮模式
  if (theme == AppConst.light) {
    label = AppConst.labelDark;
    themeData = ThemeData.light();
  }
  // 黑暗模式
  if (theme == AppConst.dark) {
    label = AppConst.labelLight;
    themeData = ThemeData.dark();
  }

  // 国际化
  String? locale = HiveUtil.appBox().get(HiveKey.appLocale);
  locale ??= AppConst.localDefault;

  // 持久化
  LocaleSettings.setLocaleRaw(locale);

  return AppEnvNotifier(AppEnv(
    title: title,
    label: label,
    theme: theme,
    themeData: themeData,
    locale: locale,
  ));
});

//
final appSettingProvider = StateNotifierProvider<AppSettingNotifier, AppSetting>((ref) {
  //
  return AppSettingNotifier(const AppSetting());
});
