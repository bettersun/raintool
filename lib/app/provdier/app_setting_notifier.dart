import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const.dart';
import '../entity/app_setting.dart';

class AppSettingNotifier extends StateNotifier<AppSetting> {
  AppSettingNotifier(AppSetting? state) : super(state ?? const AppSetting());

  /// 初始化
  void init() async {
    final String s = await rootBundle.loadString(AssetConst.menu);
    final Map<String, dynamic> m = const JsonDecoder().convert(s) as Map<String, dynamic>;
    final List<MenuItem> menuList = AppSetting.fromJson(m) as List<MenuItem>;

    state = state.copyWith(
      menuItemList: menuList,
    );
  }
}
