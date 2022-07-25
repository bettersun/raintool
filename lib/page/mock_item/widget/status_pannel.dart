import 'package:flutter/material.dart';

import '../entity/entity.dart';

/// 状态栏面板
class StatusPannel extends StatelessWidget {
  /// 模拟服务View
  final InfoDetailView view;

  const StatusPannel({required this.view});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blueAccent[100],
      padding: EdgeInsets.all(8),
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
