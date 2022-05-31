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
}
