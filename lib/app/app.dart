import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/app/provdier/app_env.dart';

import 'provdier/app_provider.dart';

class RainApp extends ConsumerStatefulWidget {
  const RainApp({Key? key}) : super(key: key);

  @override
  RainAppState createState() => RainAppState();
}

class RainAppState extends ConsumerState<RainApp> {
  @override
  void initState() {
    ref.read(appEnvProvider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppEnv appEnv = ref.watch(appEnvProvider);
    print(appEnv.theme);

    return MaterialApp(
      theme: appEnv.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appEnv.title),
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
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
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
