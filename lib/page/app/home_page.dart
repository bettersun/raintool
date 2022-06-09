import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:raintool/page/app/provdier/app_provider.dart';

import '../../common/i18n/strings.g.dart';
import 'entity/app_setting.dart';
import 'widget/menu.dart';
import 'widget/navibar.dart';

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
              icon: Icon(Icons.home),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        title: Text(t.hello),
      ),

      // 菜单
      drawer: Menu(
        itemList: appSetting.menuItemList,
        currentIndex: appSetting.menuItemIndex,
      ),
      // 底边栏
      bottomNavigationBar: !appSetting.showNavibar
          ? null
          : NaviBar(
              itemList: appSetting.naviItemList,
              currentIndex: appSetting.naviItemIndex,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: Text('Test'),
              onPressed: () {
                print('TextButton Pressed.');
                GoRouter.of(context).go('/scrollable');
              },
            ),
            TextButton(
              child: Text('Setting'),
              onPressed: () {
                print('TextButton Pressed.');
                GoRouter.of(context).go('/setting');
              },
            ),
          ],
        ),
      ),
    );
  }
}
