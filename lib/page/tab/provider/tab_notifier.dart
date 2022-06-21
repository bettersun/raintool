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
  void reorder(List<OrderUpdateEntity> orderUpdateEntities, bool enabled) async {
    state = await _tabService.reorder(state, orderUpdateEntities, enabled);
  }

  /// 过滤
  void filter() {
    // state = _tabService.filter(state);
  }

  /// 切换编辑模式
  void toggleEditMode() {
    state = _tabService.toggleEditMode(state);
  }

  /// 启用标签
  void enableTab(String flag) {
    state = _tabService.enableTab(state, flag);
  }

  /// 禁用标签
  void disableTab(String flag) {
    state = _tabService.disableTab(state, flag);
  }
}
