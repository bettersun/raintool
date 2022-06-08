import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/i18n/strings.g.dart';
import 'entity/app_env.dart';
import 'entity/app_setting.dart';
import 'provdier/app_provider.dart';
import 'setting.dart';
import 'widget/menu.dart';
import 'widget/navibar.dart';

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

    return MaterialApp(
      theme: appEnv.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(t.hello),
        ),
        // 菜单
        drawer: Menu(
          itemList: appSetting.menuItemList,
          currentIndex: appSetting.menuItemIndex,
        ),
        // 底边栏
        bottomNavigationBar: !appEnv.showNavibar
            ? null
            : NaviBar(
                itemList: appSetting.naviItemList,
                currentIndex: appSetting.naviItemIndex,
              ),
        body: const Setting(),
      ),
    );
  }
}
