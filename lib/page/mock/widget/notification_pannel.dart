import 'package:flutter/material.dart';

import '../entity/vm.dart';
import '../theme_const.dart';

/// 通知面板
class NotificationPannel extends StatefulWidget {
  /// 模拟服务View
  final MockServiceView view;

  const NotificationPannel({required this.view});

  @override
  _NotificationPannelState createState() {
    return _NotificationPannelState();
  }
}

class _NotificationPannelState extends State<NotificationPannel> {
  final ScrollController _scrollCtrlr = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (_scrollCtrlr.hasClients) {
      // 自动跳转到最下面
      _scrollCtrlr.animateTo(_scrollCtrlr.position.maxScrollExtent,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      // _scrollCtrlr.jumpTo(_scrollCtrlr.position.maxScrollExtent);
    }

    List<Widget> notification = [];
    if (widget.view.notification.isNotEmpty) {
      notification = widget.view.notification.map((e) {
        return Text(e);
      }).toList();
    }

    return Container(
      alignment: Alignment.center,
      color: Colors.blue[100],
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: ListView(
        controller: _scrollCtrlr,
        children: notification,
      ),
    );
  }
}
