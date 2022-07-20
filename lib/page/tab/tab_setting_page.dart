import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget.dart';
import 'entity/tab_info.dart';
import 'provider/tab_provider.dart';
import 'widget/tab_label.dart';

/// 标签设定页面
class TabSettingPage extends ConsumerStatefulWidget {
  const TabSettingPage({Key? key}) : super(key: key);

  @override
  _TabSettingPageState createState() => _TabSettingPageState();
}

class _TabSettingPageState extends ConsumerState<TabSettingPage> {
  final _scrollController1 = ScrollController();
  final _scrollController2 = ScrollController();
  final _gridViewKey1 = GlobalKey();
  final _gridViewKey2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // 标签信息
    final TabInfo tabInfo = ref.watch(tabProvider);

    // 可用
    List<Widget> tabFlags1 = tabInfo.enabledTabList
        .map((e) => TabLabel(
            key: Key(e.flag),
            item: e,
            editMode: tabInfo.editMode,
            enable: true,
            closeEvent: ref.read(tabProvider.notifier).disableTab))
        .toList();

    // 不可用
    List<Widget> tabFlags2 = tabInfo.disabledTabList
        .map((e) => TabLabel(
            key: Key(e.flag),
            item: e,
            editMode: tabInfo.editMode,
            enable: false,
            closeEvent: ref.read(tabProvider.notifier).enableTab))
        .toList();

    return Scaffold(
      body: RainFrame(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: tabInfo.editMode ? const Text('完成') : const Text('编辑'),
                onPressed: () {
                  ref.read(tabProvider.notifier).toggleEditMode();
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: ReorderableBuilder(
                children: tabFlags1,
                enableDraggable: tabInfo.editMode,
                scrollController: _scrollController1,
                onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
                  ref.read(tabProvider.notifier).reorder(orderUpdateEntities, true);
                },
                builder: (children) {
                  return GridView(
                    key: _gridViewKey1,
                    controller: _scrollController1,
                    children: children,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 2,
                      childAspectRatio: 5,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: ReorderableBuilder(
                children: tabFlags2,
                enableDraggable: tabInfo.editMode,
                scrollController: _scrollController2,
                onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
                  ref.read(tabProvider.notifier).reorder(orderUpdateEntities, false);
                },
                builder: (children) {
                  return GridView(
                    key: _gridViewKey2,
                    controller: _scrollController2,
                    children: children,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 8,
                      childAspectRatio: 5,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: const RainBackButton(),
    );
  }
}
