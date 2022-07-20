import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';

import '../../../common/const/app_const.dart';
import '../../../common/const/hive_key.dart';
import '../../../common/i18n/strings.g.dart';
import '../../../common/util/hive_util.dart';
import '../entity/app_env.dart';
import '../entity/app_setting.dart';
import '../entity/user.dart';
import '../service/app_service.dart';
import 'app_env_notifier.dart';
import 'app_setting_notifier.dart';
import 'router_notifier.dart';
import 'user_notifier.dart';

final AppService appService = KiwiContainer().resolve<AppService>();

final helloWorldProvider = FutureProvider<String>((ref) async {
  return await appService.rpcHello();
});

/// 应用配置 Provider
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

/// 应用设定 Provider
final appSettingProvider = StateNotifierProvider<AppSettingNotifier, AppSetting>((ref) {
  //
  return AppSettingNotifier(const AppSetting());
});

/// 用户 Provider
final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

/// 路由 Provider
/// https://github.com/lucavenir/go_router_riverpod
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    // debugLogDiagnostics: true, // For demo purposes
    refreshListenable: router, // This notifiies `GoRouter` for refresh events
    redirect: router.redirectLogic, // All the logic is centralized here
    routes: router.routes, // All the routes can be found there
  );
});
