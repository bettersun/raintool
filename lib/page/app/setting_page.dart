import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const.dart';
import 'entity/app_setting.dart';
import 'provdier/app_provider.dart';
import 'widget/menu.dart';

/// 设定
class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              });
        }),
      ),
      // 菜单
      drawer: const Menu(),
      body: TextButton(
        child: const Text('Menu Setting'),
        onPressed: () {
          print('Setting Button');
          context.push(RouterConst.pathMenuSetting);
        },
      ),
    );
  }
}
