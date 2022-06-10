import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'entity/app_setting.dart';
import 'provdier/app_provider.dart';
import 'widget/menu.dart';

/// 菜单设定
class MenuSettingPage extends ConsumerWidget {
  const MenuSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 应用设定
    final AppSetting appSetting = ref.watch(appSettingProvider);

    List<Widget> list = [];

    for (var item in appSetting.menuItemList) {
      list.add(
        TextButton(
          key: Key(const Uuid().v4()),
          child: Text(
            item.label,
            softWrap: false,
          ),
          onPressed: () {
            print(item.index);
          },
        ),
      );
    }

    var view = ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        // 重新排序菜单
        ref.read(appSettingProvider.notifier).reorderMenuItem(oldIndex, newIndex);
      },
      children: list,
    );

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
      body: view,
    );
  }
}
