import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/app_setting.dart';
import '../provdier/app_provider.dart';

/// 菜单
class Menu extends ConsumerWidget {
  final int currentIndex;
  final List<BMenuItem> itemList;

  const Menu({Key? key, required this.itemList, required this.currentIndex}) : super(key: key);

  /// 点击菜单
  void tapItem(WidgetRef ref, BMenuItem item) {
    // 切换语言
    if (item.flag == 'locale') {
      ref.read(appEnvProvider.notifier).changeLocale();
    }
    // 切换主题
    if (item.flag == 'theme') {
      ref.read(appEnvProvider.notifier).toggleTheme();
    }
    // 切换底边栏
    if (item.flag == 'pages') {
      ref.read(appSettingProvider.notifier).toggleNavibar();
    }

    // 改变菜单
    ref.read(appSettingProvider.notifier).changeMenu(item.index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> list = [];

    // 菜单头
    list.add(
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
    );

    // 菜单项目
    for (var item in itemList) {
      list.add(
        ListTile(
          title: Text(item.label),
          trailing: Icon(item.icon),
          selectedColor: Colors.blueAccent,
          selected: item.index == currentIndex,
          onTap: () {
            tapItem(ref, item);
          },
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: list,
      ),
    );
  }
}
