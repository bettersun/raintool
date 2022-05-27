import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:raintool/app/entity/app_setting.dart';
import 'package:raintool/app/respository/app_repository.dart';

import '../../common/const.dart';
import '../../common/i18n/strings.g.dart';
import '../../common/util.dart';
import '../entity/app_env.dart';
import 'app_service.dart';

class AppServiceImpl extends AppService {
  final AppRepository repo = KiwiContainer().resolve<AppRepository>();

  @override
  Future<String> helloWorld() async {
    return await repo.helloWorld();
  }

  @override
  bool checkEnv() {
    String? apiServer = HiveUtil.appBox().get(HiveKey.apiServer);
    String? rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
    int? rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);

    if (StringUtils.isNullOrEmpty(apiServer) || StringUtils.isNullOrEmpty(rpcServerIp) || rpcServerPort == null) {
      return false;
    }

    return true;
  }

  @override
  AppEnv toggleTheme(AppEnv state) {
    // 明亮模式 -> 黑暗模式
    if (state.theme == AppConst.light) {
      state = state.copyWith(
        theme: AppConst.dark,
        label: AppConst.labelLight,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, AppConst.dark);
      return state;
    }
    // 黑暗模式 -> 明亮模式
    if (state.theme == AppConst.dark) {
      state = state.copyWith(
        theme: AppConst.light,
        label: AppConst.labelDark,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, AppConst.light);
      return state;
    }

    return state;
  }

  @override
  AppEnv changeLocale(AppEnv state) {
    switch (state.locale) {
      // 英语
      case AppConst.localEnUs:
        state = state.copyWith(
          // 汉语（中国）
          locale: AppConst.localZhCn,
        );
        break;
      // 汉语（中国）
      case AppConst.localZhCn:
        state = state.copyWith(
          // 汉语（香港）
          locale: AppConst.localZhHk,
        );
        break;
      // 汉语（香港）
      case AppConst.localZhHk:
        state = state.copyWith(
          // 日语
          locale: AppConst.localJaJp,
        );
        break;
      // 日语
      case AppConst.localJaJp:
        state = state.copyWith(
          // 英语
          locale: AppConst.localEnUs,
        );
        break;
      default:
        state = state.copyWith(
          // 默认语言
          locale: AppConst.localDefault,
        );
    }

    // 反映
    LocaleSettings.setLocaleRaw(state.locale);
    // 持久化
    HiveUtil.appBox().put(HiveKey.appLocale, state.locale);

    return state;
  }

  @override
  Future<AppSetting> init(AppSetting state) async {
    final List<NaviItem> l = await repo.loadMenu();

    final List<NaviItem> list = [];
    for (NaviItem item in l) {
      IconData iconData = loadIconData(item.flag);
      list.add(item.copyWith(icon: iconData));
    }

    state = state.copyWith(
      naviItemList: list,
    );

    return state;
  }

  /// 图标
  IconData loadIconData(String flag) {
    if (flag == 'home') {
      return Icons.home;
    }
    if (flag == 'email') {
      return Icons.email;
    }
    if (flag == 'address') {
      return Icons.airplay;
    }
    if (flag == 'pages') {
      return Icons.pages;
    }
    if (flag == 'setting') {
      return Icons.settings;
    }

    return Icons.home;
  }

  @override
  AppSetting changeMenuIndex(AppSetting state, int index) {
    return state.copyWith(
      menuItemIndex: index,
    );
  }

  @override
  AppSetting changeNaviIndex(AppSetting state, int index) {
    return state.copyWith(
      naviItemIndex: index,
    );
  }
}
