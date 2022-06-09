import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../scrollable/scrollable_page.dart';
import 'entity/app_env.dart';
import 'entity/app_setting.dart';
import 'home_page.dart';
import 'provdier/app_provider.dart';
import 'setting_page.dart';

/// Rain 工具应用
class RainApp extends ConsumerStatefulWidget {
  const RainApp({Key? key}) : super(key: key);

  @override
  RainAppState createState() => RainAppState();
}

class RainAppState extends ConsumerState<RainApp> {
  @override
  void initState() {
    super.initState();
    // 初始化
    // ref.read(appEnvProvider.notifier).init();
    ref.read(appSettingProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    // 应用配置
    final AppEnv appEnv = ref.watch(appEnvProvider);
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/scrollable',
          builder: (context, state) => const ScrollablePage(),
        ),
        GoRoute(
          path: '/setting',
          builder: (context, state) => const SettingPage(),
        ),
      ],
    );

    // return MaterialApp.router(
    //   routeInformationParser: _router.routeInformationParser,
    //   routerDelegate: _router.routerDelegate,
    //   theme: appEnv.themeData,
    // );

    return MaterialApp(
      theme: appEnv.themeData,
      home: const HomePage(),
    );

    // return MaterialApp(
    //   theme: appEnv.themeData,
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text(t.hello),
    //     ),
    //     // 菜单
    //     drawer: Menu(
    //       itemList: appSetting.menuItemList,
    //       currentIndex: appSetting.menuItemIndex,
    //     ),
    //     // 底边栏
    //     bottomNavigationBar: !appSetting.showNavibar
    //         ? null
    //         : NaviBar(
    //             itemList: appSetting.naviItemList,
    //             currentIndex: appSetting.naviItemIndex,
    //           ),
    //     body: const SettingPage(),
    //   ),
    // );
  }
}
