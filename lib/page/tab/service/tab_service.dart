import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';

import '../entity/tab_info.dart';

abstract class TabService {
  /// 初始化
  Future<TabInfo> init();

  /// 重新排序
  Future<TabInfo> reorder(TabInfo state, List<OrderUpdateEntity> orderUpdateEntities, bool enabled);

  /// 切换编辑模式
  TabInfo toggleEditMode(TabInfo state);

  /// 启用标签
  TabInfo enableTab(TabInfo state, String flag);

  /// 禁用标签
  TabInfo disableTab(TabInfo state, String flag);
}
