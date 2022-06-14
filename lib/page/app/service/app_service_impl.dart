import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

import '../../../common/const/app_const.dart';
import '../../../common/const/hive_key.dart';
import '../../../common/i18n/strings.g.dart';
import '../../../common/util/app_util.dart';
import '../../../common/util/hive_util.dart';
import '../entity/app_env.dart';
import '../entity/app_setting.dart';
import '../repository/app_repository.dart';
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
    List<BMenuItem> list = await repo.loadMenu();

    // 菜单项目
    // 排序
    list.sort((a, b) => a.orderNum.compareTo(b.orderNum));

    final List<BMenuItem> mList = [];

    int j = 0;
    for (BMenuItem item in list) {
      if (item.enabled) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        String path = AppUtil.routerPath(item.flag);
        mList.add(item.copyWith(
          index: j,
          icon: iconData,
          path: path,
        ));
        j++;
      }
    }

    // 底边栏项目
    // 排序
    list.sort((a, b) => a.naviOrder.compareTo(b.naviOrder));

    final List<BMenuItem> nList = [];

    int i = 0;
    for (BMenuItem item in list) {
      if (item.naviItem) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        String path = AppUtil.routerPath(item.flag);
        nList.add(item.copyWith(
          index: i,
          icon: iconData,
          path: path,
        ));
        i++;
      }
    }

    bool showNavibar = HiveUtil.appBox().get(HiveKey.showNavibar) ?? false;
    // 底边栏项目数少于2时，不显示底边栏
    if (nList.length < 2) {
      showNavibar = false;
    }

    //
    state = state.copyWith(
      menuItemList: mList,
      naviItemList: nList,
      showNavibar: showNavibar,
    );

    return state;
  }

  @override
  AppSetting toggleNavibar(AppSetting state) {
    final bool showNavibar = !state.showNavibar;
    HiveUtil.appBox().put(HiveKey.showNavibar, showNavibar);
    return state.copyWith(showNavibar: showNavibar);
  }

  @override
  AppSetting changeMenu(AppSetting state, int index) {
    // 对应的底边栏下标
    int naviIndex = 0; // 下标 > 0
    BMenuItem m = state.menuItemList[index];
    for (BMenuItem item in state.naviItemList) {
      if (m.flag == item.flag) {
        naviIndex = item.index;
      }
    }

    return state.copyWith(
      selectedMenuIndex: index,
      selectedNaviIndex: naviIndex,
    );
  }

  @override
  AppSetting changeNavi(AppSetting state, int index) {
    // 对应的菜单下标
    int menuIndex = -1; // 默认不选中
    BMenuItem n = state.naviItemList[index];
    for (BMenuItem item in state.menuItemList) {
      if (n.flag == item.flag) {
        menuIndex = item.index;
      }
    }

    return state.copyWith(
      selectedMenuIndex: menuIndex,
      selectedNaviIndex: index,
    );
  }

  @override
  AppSetting reorderMenuItem(AppSetting state, int oldIndex, int newIndex) {
    List<BMenuItem> newMenuItemList = [];
    for (var item in state.menuItemList) {
      newMenuItemList.add(item);
    }

    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }

    var element = newMenuItemList.removeAt(oldIndex);
    newMenuItemList.insert(newIndex, element);

    //  TODO: 持久化

    return state.copyWith(menuItemList: newMenuItemList);
  }
}
