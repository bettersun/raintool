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
              child: const Text('Setting'),
              onPressed: () {
                context.push(RouterConst.pathSetting);
              },
            ),
            TextButton(
              child: const Text('Menu Setting'),
              onPressed: () {
                context.push(RouterConst.pathMenuSetting);
              },
            ),
            TextButton(
              child: const Text('Tabbar'),
              onPressed: () {
                context.push(RouterConst.pathTabbar);
              },
            ),
            TextButton(
              child: const Text('Scrollable'),
              onPressed: () {
                context.push(RouterConst.pathScrollable);
              },
            ),
            TextButton(
              child: const Text('Animation'),
              onPressed: () {
                context.push(RouterConst.pathAnimation);
              },
            ),
            TextButton(
              child: const Text('Call Api'),
              onPressed: () {
                context.push(RouterConst.pathCallApi);
              },
            ),
            TextButton(
              child: const Text('Datepicker'),
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                  // locale: Locale(appEnv.locale),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
