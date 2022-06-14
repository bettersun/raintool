import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'entity/tab_info.dart';
import 'provider/tab_provider.dart';

/// https://api.flutter.dev/flutter/material/TabController-class.html
/// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/
class TabPage extends ConsumerStatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  TabPageState createState() => TabPageState();
}

class TabPageState extends ConsumerState<TabPage> with TickerProviderStateMixin<TabPage> {
  late TabController _controller;
  late List<Tab> tabs;
  late List<Text> contents;

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
      print("Selected Index: " + _controller.index.toString());
    });

    // 标签
    tabs = tabInfo.tabItemList.map((e) => Tab(text: e.flag)).toList();
    // 内容
    contents = tabInfo.tabItemList.map((e) => Text(e.flag)).toList();

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        flexibleSpace: TabBar(
          controller: _controller,
          tabs: tabs,
        ),
        toolbarHeight: 48,
      ),
      body: TabBarView(
        controller: _controller,
        children: contents,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
