import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/app_setting.dart';
import '../service/app_service.dart';

class AppSettingNotifier extends StateNotifier<AppSetting> {
  AppSettingNotifier(AppSetting? state) : super(state ?? const AppSetting());

  final AppService _appService = KiwiContainer().resolve<AppService>();

  /// 初始化
  void init() async {
    state = await _appService.initAppSetting(state);
  }

  /// 改变菜单下标
  void changeMenu(int index) {
    state = _appService.changeMenu(state, index);
  }

  /// 改变底边栏下标
  void changeNavi(int index) {
    state = _appService.changeNavi(state, index);
  }

  /// 重新排序菜单
  void reorderMenuItem(int oldIndex, int newIndex) {
    state = _appService.reorderMenuItem(state, oldIndex, newIndex);
  }

  /// 切换底边栏
  void toggleNavibar() {
    state = _appService.toggleNavibar(state);
  }
}
