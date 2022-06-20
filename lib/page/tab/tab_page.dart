import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/router_const.dart';
import '../../common/widget/rain_back_button.dart';
import 'entity/tab_info.dart';
import 'provider/tab_provider.dart';
import 'widget/tab_inner.dart';

class TabPage extends ConsumerStatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends ConsumerState<TabPage> with TickerProviderStateMixin<TabPage> {
  late TabController _controller;
  late List<Tab> tabs;
  late List<Widget> contents;

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

    TabController _controller = TabController(length: tabInfo.tabItemList.length, vsync: this);
    _controller.index = tabInfo.selectedTabIndex;

    _controller.addListener(() {
      if (_controller.index == _controller.animation?.value) {
        print("Selected Index: " + _controller.index.toString());
      }
    });

    // 标签
    tabs = tabInfo.tabItemList.map((e) => Tab(text: e.flag)).toList();
    // 内容
    contents = tabInfo.tabItemList.map((e) => const TabInner()).toList();

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        bottom: TabBar(
          controller: _controller,
          tabs: tabs,
        ),
        // flexibleSpace: Container(
        //   // margin: EdgeInsets.only(top: 40),
        //   child: Stack(
        //     children: [
        //       TabBar(
        //         controller: _controller,
        //         tabs: tabs,
        //       ),
        // Container(
        //   margin: EdgeInsets.only(right: 40),
        //   alignment: Alignment.centerRight,
        //   child: PopupMenuButton(
        //     splashRadius: 1,
        //     icon: const Icon(
        //       Icons.filter_list,
        //       color: Colors.white70,
        //     ),
        //     itemBuilder: (BuildContext context) {
        //       final List<PopupMenuEntry<String>> popList = [];
        //
        //       popList.add(const PopupMenuItem<String>(
        //         value: 'Test',
        //         child: Text('Test'),
        //       ));
        //
        //       return popList;
        //     },
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.centerRight,
        //   child: IconButton(
        //     icon: const Icon(
        //       Icons.menu,
        //       color: Colors.white70,
        //     ),
        //     onPressed: () {
        //       //
        //       print('go to tab\'s setting');
        //       context.push(RouterConst.pathTabbarSetting);
        //     },
        //   ),
        // ),
        // ],
        // ),
        // ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 40),
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
