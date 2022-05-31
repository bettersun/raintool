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
        themeData: ThemeData.dark(),
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
        themeData: ThemeData.light(),
        label: AppConst.labelDark,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, AppConst.light);
      return state;
    }

    return state;
  }

  @override
  AppEnv toggleNavibar(AppEnv state) {
    return state.copyWith(showNavibar: !state.showNavibar);
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
  Future<AppSetting> initAppSetting(AppSetting state) async {
    // 底边栏项目
    List<NaviItem> l = await repo.loadNaviMenu();
    // 排序
    l.sort((a, b) => a.orderNum.compareTo(b.orderNum));

    final List<NaviItem> list = [];

    int i = 0;
    for (NaviItem item in l) {
      if (item.enabled) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        list.add(item.copyWith(
          index: i,
          icon: iconData,
        ));
        i++;
      }
    }

    // 菜单项目
    List<BMenuItem> bl = await repo.loadMenu();
    // 排序
    bl.sort((a, b) => a.orderNum.compareTo(b.orderNum));

    final List<BMenuItem> mList = [];

    int j = 0;
    for (BMenuItem item in bl) {
      if (item.enabled) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        mList.add(item.copyWith(
          index: j,
          icon: iconData,
        ));
        j++;
      }
    }

    state = state.copyWith(
      menuItemList: mList,
      naviItemList: list,
    );

    return state;
  }

  @override
  AppSetting changeMenu(AppSetting state, int index) {
    // 对应的底边栏下标
    int naviIndex = 0; // 下标 > 0
    BMenuItem m = state.menuItemList[index];
    for (NaviItem item in state.naviItemList) {
      if (m.flag == item.flag) {
        naviIndex = item.index;
      }
    }

    return state.copyWith(
      menuItemIndex: index,
      naviItemIndex: naviIndex,
    );
  }

  @override
  AppSetting changeNavi(AppSetting state, int index) {
    // 对应的菜单下标
    int menuIndex = -1; // 默认不选中
    NaviItem n = state.naviItemList[index];
    for (BMenuItem item in state.menuItemList) {
      if (n.flag == item.flag) {
        menuIndex = item.index;
      }
    }

    return state.copyWith(
      menuItemIndex: menuIndex,
      naviItemIndex: index,
    );
  }
}
