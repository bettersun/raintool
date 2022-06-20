import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const.dart';
import '../../common/i18n/strings.g.dart';
import 'entity/app_setting.dart';
import 'provider/app_provider.dart';
import 'widget/drawer_menu.dart';
import 'widget/navibar.dart';

/// 主页
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    return Scaffold(
      key: const Key('home_page'),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        title: Text(t.hello),
      ),

      // 菜单
      drawer: const DrawerMenu(),
      // 底边栏
      bottomNavigationBar: !appSetting.showNavibar ? null : const NaviBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: Text('Setting'),
              onPressed: () {
                print('TextButton Pressed.');
                context.push(RouterConst.pathSetting);
              },
            ),
            TextButton(
              child: Text('Menu Setting'),
              onPressed: () {
                context.push(RouterConst.pathMenuSetting);
              },
            ),
            TextButton(
              child: Text('Tabbar'),
              onPressed: () {
                print('TextButton Pressed.');
                context.push(RouterConst.pathTabbar);
              },
            ),
            TextButton(
              child: Text('Scrollable'),
              onPressed: () {
                print('TextButton Pressed.');
                context.push(RouterConst.pathScrollable);
              },
            ),
          ],
        ),
      ),
    );
  }
}
