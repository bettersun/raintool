import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/app/entity/app_setting.dart';
import 'package:raintool/app/widget/home_view.dart';
import 'package:raintool/app/widget/navibar.dart';

import '../common/i18n/strings.g.dart';
import 'entity/app_env.dart';
import 'provdier/app_provider.dart';

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
    ref.read(appEnvProvider.notifier).init();
    ref.read(appSettingProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    // 应用配置
    final AppEnv appEnv = ref.watch(appEnvProvider);
    // 主题
    final ThemeData themeData = ref.watch(themeProvider);
    // print(appEnv.theme);

    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(t.hello),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: Text(t.hello),
                onTap: () {
                  // 切换语言
                  ref.read(appEnvProvider.notifier).changeLocale();
                },
              ),
              ListTile(
                title: Text(appEnv.label),
                onTap: () {
                  // 切换主题
                  ref.read(appEnvProvider.notifier).toggle();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '1',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              label: '2',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
              ),
              label: '3',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
              ),
              label: '4',
              backgroundColor: Colors.blueAccent,
            )
          ],
          currentIndex: 0,
          onTap: (int index) {},
        ),
        body: const HomeView(),
      ),
    );
  }
}
