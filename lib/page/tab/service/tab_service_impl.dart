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
  Future<TabInfo> reorder(TabInfo state, List<OrderUpdateEntity> orderUpdateEntities, bool enabled) async {
    List<TabItem> tabItemList = [];

    if (enabled) {
      // 可用标签
      for (var item in state.enabledTabList) {
        tabItemList.add(item);
      }
    } else {
      // 不可用标签
      for (var item in state.disabledTabList) {
        tabItemList.add(item);
      }
    }

    // 替换位置
    for (final orderUpdateEntity in orderUpdateEntities) {
      final item = tabItemList.removeAt(orderUpdateEntity.oldIndex);
      tabItemList.insert(orderUpdateEntity.newIndex, item);
    }

    if (enabled) {
      state = state.copyWith(
        enabledTabList: tabItemList,
      );
    } else {
      state = state.copyWith(
        disabledTabList: tabItemList,
      );
    }

    return state;
  }

  @override
  TabInfo editTab(TabInfo state) {
    return state.copyWith(editMode: !state.editMode);
  }

  @override
  TabInfo enableTab(TabInfo state, String flag) {
    // 不可用标签
    List<TabItem> disabled = [];
    // 启用的标签项
    TabItem? enabledItem;
    for (var item in state.disabledTabList) {
      if (item.flag == flag) {
        enabledItem = item;
      } else {
        disabled.add(item);
      }
    }

    // 可用标签
    List<TabItem> enabled = [];
    for (var item in state.enabledTabList) {
      enabled.add(item);
    }
    // 添加启用的标签项
    if (enabledItem != null) {
      enabled.add(enabledItem);
    }

    return state.copyWith(
      enabledTabList: enabled,
      disabledTabList: disabled,
    );
  }

  @override
  TabInfo disableTab(TabInfo state, String flag) {
    // 可用标签
    List<TabItem> enabled = [];
    // 禁用的标签项
    TabItem? disabledItem;
    for (var item in state.enabledTabList) {
      if (item.flag == flag) {
        disabledItem = item;
      } else {
        enabled.add(item);
      }
    }

    // 不可用标签
    List<TabItem> disabled = [];
    for (var item in state.disabledTabList) {
      disabled.add(item);
    }
    // 添加禁用的标签项
    if (disabledItem != null) {
      disabled.add(disabledItem);
    }

    return state.copyWith(
      enabledTabList: enabled,
      disabledTabList: disabled,
    );
  }
}
