import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/app_setting.dart';
import '../service/app_service.dart';

class AppSettingNotifier extends StateNotifier<AppSetting> {
  AppSettingNotifier(AppSetting? state) : super(state ?? const AppSetting());

  final AppService _appService = KiwiContainer().resolve<AppService>();

  /// 初始化
  void init() async {
    state = await _appService.init(state);
  }

  /// 改变下标
  void changeMenuIndex(int index) async {
    state = await _appService.changeMenuIndex(state, index);
  }

  /// 改变下标
  void changeNaviIndex(int index) async {
    state = await _appService.changeNaviIndex(state, index);
  }
}
