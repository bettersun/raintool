import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './provdier/app_env.dart';

import '../_i18n/strings.g.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    // 应用配置
    final AppEnv appEnv = ref.watch(appEnvProvider);
    // 主题
    final ThemeData themeData = ref.watch(themeProvider);
    // print(appEnv.theme);

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
        body: Text(appEnv.message),
      ),
    );
  }
}
