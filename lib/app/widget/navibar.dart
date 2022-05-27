import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/app/provdier/app_provider.dart';

import '../entity/app_setting.dart';

/// 底边栏
class NaviBar extends ConsumerWidget {
  final int currentIndex;
  final List<NaviItem> itemList;

  const NaviBar({Key? key, required this.itemList, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (itemList.length < 2) {
      return Container();
    }

    final List<BottomNavigationBarItem> naviBarItemList = [];
    for (var item in itemList) {
      naviBarItemList.add(
        BottomNavigationBarItem(
          icon: Icon(
            item.icon,
          ),
          label: item.label,
          backgroundColor: Colors.blueAccent,
          tooltip: item.tooltip,
        ),
      );
    }

    return BottomNavigationBar(
      selectedItemColor: Colors.indigo,
      items: naviBarItemList,
      currentIndex: currentIndex,
      onTap: (int index) {
        // 切换
        ref.read(appSettingProvider.notifier).changeNaviIndex(index);
      },
    );
  }
}
