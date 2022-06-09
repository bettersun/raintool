import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'entity/app_setting.dart';
import 'provdier/app_provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

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
    return view;
  }
}
