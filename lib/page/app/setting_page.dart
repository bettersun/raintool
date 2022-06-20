import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const.dart';
import '../../common/i18n/strings.g.dart';
import '../../common/widget.dart';
import 'entity/app_setting.dart';
import 'provider/app_provider.dart';
import 'widget/drawer_menu.dart';

/// 设定
class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

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

    // 画面跳转（入栈）
    if (item.flag == MenuConst.pages || item.flag == MenuConst.todo) {
      context.push(item.path);
    }
    // 画面跳转（不入栈直接跳转）
    if (item.flag == MenuConst.home) {
      context.go(item.path);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    final List<Widget> list = [];

    // 菜单项目
    for (var item in appSetting.menuItemList) {
      if (item.flag == MenuConst.theme || item.flag == MenuConst.toggleNavi || item.flag == MenuConst.locale) {
        Widget? trailing;
        if (item.flag == MenuConst.toggleNavi) {
          trailing = appSetting.showNavibar ? const Text('主页底边栏已显示') : const Text('主页底边栏已隐藏');
        }

        list.add(
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(1.0),
            // color: Colors.tealAccent,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1.0)),
              border: Border.all(color: Colors.lightBlueAccent),
            ),
            child: ListTile(
              title: Text(item.label),
              trailing: trailing,
              onTap: () {
                tapItem(context, ref, item);
              },
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              });
        }),
        title: Text(t.setting),
      ),
      // 菜单
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        primary: false,
        child: RainFrame(
          child: Column(
            children: list,
          ),
        ),
      ),
    );
  }
}
