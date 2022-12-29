import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const.dart';
import '../../common/i18n/strings.g.dart';
import '../../rpc/rpc_mock.dart';
import '../mock/entity/entity.dart';
import 'entity/entity.dart';
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

    // 初始化消息
    ref.listen<AppEnv>(appEnvProvider, (previous, next) {
      final snackBar = SnackBar(
        content: Text(next.message),
        duration: const Duration(seconds: 1),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return Scaffold(
      key: const Key('home_page'),
      // 标题栏
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
      // 内容
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
              child: const Text('Mock'),
              onPressed: () {
                context.push(RouterConst.pathMock);
              },
            ),
            TextButton(
              child: const Text('Mock Item'),
              onPressed: () {
                // context.push(RouterConst.pathMockItem);
                context.push(RouterConst.pathMockItem, extra: MockServiceInfoView());
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
            TextButton(
              child: const Text('Hello DB'),
              onPressed: () async {},
            ),
            TextButton(
              child: const Text('Start Mock'),
              onPressed: () async {
                //
                RpcMock().startMock([]);
              },
            ),
            TextButton(
              child: const Text('Stop Mock'),
              onPressed: () async {
                //
                RpcMock().stopMock([]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
