import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';

import '../entity/tab_info.dart';

abstract class TabService {
  /// 初始化
  Future<TabInfo> init();

  /// 重新排序
  Future<TabInfo> reorder(TabInfo state, List<OrderUpdateEntity> orderUpdateEntities);
}
