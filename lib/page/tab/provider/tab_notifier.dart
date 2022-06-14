import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/tab_info.dart';
import '../service/tab_service.dart';

class TabNotifier extends StateNotifier<TabInfo> {
  TabNotifier(TabInfo? state) : super(state ?? const TabInfo());

  final TabService _tabService = KiwiContainer().resolve<TabService>();

  /// 初始化
  void init() async {
    state = await _tabService.init();
  }

  /// 过滤
  void filter() {
    // state = _appService.toggleNavibar(state);
  }
}
