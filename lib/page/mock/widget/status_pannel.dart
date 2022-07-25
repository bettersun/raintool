import 'package:flutter/material.dart';

import '../entity/entity.dart';
import '../theme_const.dart';

/// 状态栏面板
class StatusPannel extends StatelessWidget {
  /// 模拟服务View
  final MockServiceView view;

  const StatusPannel({required this.view});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blueAccent[100],
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: Row(
        children: [
          // 运行信息
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: Text(view.info),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
