import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../common/widget.dart';
import 'entity/app_setting.dart';
import 'provider/app_provider.dart';
import 'widget/drawer_menu.dart';

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
        Row(
          key: Key(const Uuid().v4()),
          children: [
            Expanded(
              child: Container(
                key: Key(const Uuid().v4()),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(1.0),
                // color: Colors.tealAccent,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(1.0)),
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                child: Text(
                  item.label,
                  softWrap: false,
                ),
              ),
            ),
          ],
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      // 菜单
      drawer: const DrawerMenu(),
      body: RainFrame(
        child: view,
      ),
    );
  }
}
