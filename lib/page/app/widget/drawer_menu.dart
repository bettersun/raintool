import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const.dart';
import '../../../common/i18n/strings.g.dart';
import '../entity/app_setting.dart';
import '../provider/app_provider.dart';

///  侧边栏菜单
class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  /// 点击菜单
  static void tapItem(BuildContext context, WidgetRef ref, BMenuItem item) {
    // 切换语言
    if (item.flag == MenuConst.locale) {
      ref.read(appEnvProvider.notifier).changeLocale();
    }
    // 切换主题
    if (item.flag == MenuConst.theme) {
      ref.read(appEnvProvider.notifier).toggleTheme();
    }
    // 切换底边栏
    if (item.flag == MenuConst.toggleNavi) {
      ref.read(appSettingProvider.notifier).toggleNavibar();
    }

    // 改变菜单
    ref.read(appSettingProvider.notifier).changeMenu(item.index);

    // 画面跳转
    if (item.flag == MenuConst.setting || item.flag == MenuConst.pages || item.flag == MenuConst.todo) {
      Navigator.pop(context);
      context.push(item.path);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

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
    for (var item in appSetting.menuItemList) {
      list.add(
        ListTile(
          title: Text(item.label),
          trailing: Icon(item.icon),
          selectedColor: Colors.blueAccent,
          selected: item.index == appSetting.selectedMenuIndex,
          onTap: () {
            tapItem(context, ref, item);
          },
        ),
      );
    }

    list.add(
      ListTile(
        title: Text(t.logout),
        trailing: const Icon(Icons.add_to_home_screen_outlined),
        selectedColor: Colors.blueAccent,
        selected: list.length == appSetting.selectedMenuIndex,
        onTap: () {
          // 退出登录
          ref.read(userProvider.notifier).logout();
          Navigator.pop(context);
          context.go(RouterConst.pathLogin);
        },
      ),
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: list,
      ),
    );
  }
}
