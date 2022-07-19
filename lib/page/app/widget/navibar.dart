import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const.dart';
import '../entity/app_setting.dart';
import '../provider/app_provider.dart';

/// 底边栏
class NaviBar extends ConsumerWidget {
  const NaviBar({Key? key}) : super(key: key);

  /// 点击菜单
  void tapItem(BuildContext context, WidgetRef ref, int index) async {
    // 切换
    ref.watch(appSettingProvider.notifier).changeNavi(index);
    // 画面跳转
    BMenuItem item = ref.watch(appSettingProvider).naviItemList[index];
    if (item.flag == MenuConst.setting || item.flag == MenuConst.pages || item.flag == MenuConst.todo) {
      if (GoRouter.of(context).location != item.path) {
        context.push(item.path);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    if (appSetting.naviItemList.length < 2) {
      return Container();
    }

    // 底边栏项目
    final List<BottomNavigationBarItem> list = [];
    for (var item in appSetting.naviItemList) {
      list.add(
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
      items: list,
      currentIndex: appSetting.selectedNaviIndex,
      onTap: (int index) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => SettingPage(),
        //   ),
        // );
        // context.push(RouterConst.pathSetting);
        tapItem(context, ref, index);
      },
    );
  }
}
