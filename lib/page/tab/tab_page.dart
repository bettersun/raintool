import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/router_const.dart';
import '../../common/widget/rain_back_button.dart';
import 'entity/tab_info.dart';
import 'provider/tab_provider.dart';
import 'widget/tab_inner.dart';

/// 带标签的页面
class TabPage extends ConsumerStatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends ConsumerState<TabPage> with TickerProviderStateMixin<TabPage> {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    ref.read(tabProvider.notifier).init();

    _controller = TabController(length: 0, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 标签信息
    final TabInfo tabInfo = ref.watch(tabProvider);
    List<Tab> tabs = [];
    List<Widget> contents = [];

    _controller = TabController(length: tabInfo.enabledTabList.length, vsync: this);
    _controller.index = tabInfo.selectedTabIndex;

    _controller.addListener(() {
      if (_controller.index == _controller.animation?.value) {
        print("Selected Index: " + _controller.index.toString());
      }
    });

    // 可用
    for (var item in tabInfo.enabledTabList) {
      // 标签
      tabs.add(Tab(text: item.flag));
      // 内容
      contents.add(const TabInner());
    }

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        // bottom: TabBar(
        //   controller: _controller,
        //   isScrollable: true,
        //   tabs: tabs,
        // ),
        flexibleSpace: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 50),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                tabs: tabs,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                splashRadius: 1,
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white70,
                ),
                itemBuilder: (BuildContext context) {
                  final List<PopupMenuEntry<String>> popList = [];

                  popList.add(const PopupMenuItem<String>(
                    value: 'Test',
                    child: Text('Test'),
                  ));

                  return popList;
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white70,
                ),
                onPressed: () {
                  //
                  print('go to tab\'s setting');
                  context.push(RouterConst.pathTabbarSetting);
                },
              ),
            ),
          ],
        ),

        // actions: [
        //   Container(
        //     alignment: Alignment.centerRight,
        //     child: PopupMenuButton(
        //       splashRadius: 1,
        //       icon: const Icon(
        //         Icons.filter_list,
        //         color: Colors.white70,
        //       ),
        //       itemBuilder: (BuildContext context) {
        //         final List<PopupMenuEntry<String>> popList = [];
        //
        //         popList.add(const PopupMenuItem<String>(
        //           value: 'Test',
        //           child: Text('Test'),
        //         ));
        //
        //         return popList;
        //       },
        //     ),
        //   ),
        //   Container(
        //     alignment: Alignment.centerRight,
        //     child: IconButton(
        //       icon: const Icon(
        //         Icons.menu,
        //         color: Colors.white70,
        //       ),
        //       onPressed: () {
        //         //
        //         print('go to tab\'s setting');
        //         context.push(RouterConst.pathTabbarSetting);
        //       },
        //     ),
        //   ),
        // ],
        toolbarHeight: 48,
      ),
      body: TabBarView(
        controller: _controller,
        children: contents,
      ),
      floatingActionButton: const RainBackButton(),
    );
  }
}
