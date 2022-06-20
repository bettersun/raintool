import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/tab_info.dart';
import '../repository/tab_repository.dart';
import 'tab_service.dart';

class TabServiceImpl extends TabService {
  final TabRepository _repo = KiwiContainer().resolve<TabRepository>();

  //
  @override
  Future<TabInfo> init() async {
    return _repo.loadTabItemList();
  }

  @override
  Future<TabInfo> reorder(TabInfo state, List<OrderUpdateEntity> orderUpdateEntities) async {
    List<TabItem> tabItemList = [];

    for (var item in state.tabItemList) {
      tabItemList.add(item);
    }

    for (final orderUpdateEntity in orderUpdateEntities) {
      final item = tabItemList.removeAt(orderUpdateEntity.oldIndex);
      tabItemList.insert(orderUpdateEntity.newIndex, item);
    }

    state = state.copyWith(
      tabItemList: tabItemList,
    );

    return state;
  }
}
