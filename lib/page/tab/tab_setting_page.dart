import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/common/widget.dart';

import 'entity/tab_info.dart';
import 'provider/tab_provider.dart';

class TabSettingPage extends ConsumerStatefulWidget {
  const TabSettingPage({Key? key}) : super(key: key);

  @override
  _TabSettingPageState createState() => _TabSettingPageState();
}

class _TabSettingPageState extends ConsumerState<TabSettingPage> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // 标签信息
    final TabInfo tabInfo = ref.watch(tabProvider);

    // 标签
    List<Widget> tabFlags = tabInfo.tabItemList
        .map(
          (e) => Container(
            key: Key(e.flag),
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(e.flag),
          ),
        )
        .toList();

    return Scaffold(
      body: RainFrame(
        child: ReorderableBuilder(
          children: tabFlags,
          scrollController: _scrollController,
          onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
            ref.read(tabProvider.notifier).reorder(orderUpdateEntities);
          },
          builder: (children) {
            return GridView(
              key: _gridViewKey,
              controller: _scrollController,
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
      floatingActionButton: const RainBackButton(),
    );
  }
}
