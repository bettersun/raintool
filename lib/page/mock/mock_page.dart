import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';
import 'package:raintool/page/mock/entity/mock_service_view.dart';

import 'theme_const.dart';
import 'widget/widget.dart';

/// 模拟服务画面
class MockPage extends StatefulWidget {
  const MockPage({Key? key}) : super(key: key);

  @override
  MockPageState createState() => MockPageState();
}

/// 画面State
class MockPageState extends State<MockPage> {
  @override
  void initState() {
    super.initState();

    // _bloc = MockServiceBloc();
    // // 初始化
    // _bloc.add(MockServiceInitEvent());

    final KiwiContainer container = KiwiContainer();
    // final MockServicePlugin plugin = container<MockServicePlugin>();
    // 监听Go端发过来的消息
    // plugin.channel.setMethodCallHandler((MethodCall methodCall) async {
    //   // 接收通知表示消息
    //   if (methodCall.method == plugin.funcNameNotify) {
    //     final String notification = methodCall.arguments as String;
    //
    //     // 触发事件
    //     _bloc.add(MockServiceNotifiedEvent(notification: notification));
    //   }
    //
    //   // 接收通知添加新的模拟服务信息
    //   if (methodCall.method == plugin.funcNameNotifyAddMockServiceInfo) {
    //     final Map info = methodCall.arguments as Map;
    //
    //     // 触发事件
    //     _bloc.add(MockServiceAddMockServiceInfoEvent(info: info));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (BuildContext context) => _bloc,
    //   child: BlocBuilder<MockServiceBloc, MockServiceState>(builder: (context, state) {
    //     // 加载完成后，渲染
    //     if (state is MockServiceDoneState) {
    //       final Color colorNotificationIcon = state.view.visibleNotification ? Colors.deepOrangeAccent : Colors.teal;

    MockServiceView view = MockServiceView();

    // 构建组件
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text('模拟服务'),
          centerTitle: true,
          actions: [
            // 显示通知
            if (view.notification.isEmpty)
              Container()
            else
              Container(
                padding: EdgeInsets.only(right: 40),
                child: IconButton(
                  icon: Icon(
                    view.visibleNotification ? Icons.close_outlined : Icons.info,
                    color: Colors.deepOrangeAccent,
                    size: 30,
                  ),
                  onPressed: () async {
                    // 触发事件
                    // BlocProvider.of<MockServiceBloc>(context).add(MockServiceShowNotificationEvent());
                  },
                ),
              ),
          ],
        ),
        preferredSize: Size.fromHeight(ThemeConst.heightAppBar),
      ),
      body: Container(
        padding: EdgeInsets.all(ThemeConst.sideWidth),
        color: Theme.of(context).bannerTheme.backgroundColor,
        child: view.visibleNotification
            // 通知面板
            ? NotificationPannel(view: view)
            : Column(
                children: [
                  // Header面板
                  HeaderPanel(view: view),
                  // Tab面板
                  OperatePanel(view: view),
                  // 详细面板
                  Expanded(
                    child: DetailPanel(view: view),
                  ),
                  // 状态栏面板
                  StatusPannel(view: view),
                ],
              ),
      ),
      floatingActionButton: view.visibleNotification ? Container() : FAB(),
    );
    //     }
    //
    //     return Container();
    //   }),
    // );
  }
}
