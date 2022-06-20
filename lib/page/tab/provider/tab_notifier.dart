import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
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

  /// 重新排序
  void reorder(List<OrderUpdateEntity> orderUpdateEntities) async {
    state = await _tabService.reorder(state, orderUpdateEntities);
  }

  /// 过滤
  void filter() {
    // state = _appService.toggleNavibar(state);
  }
}
