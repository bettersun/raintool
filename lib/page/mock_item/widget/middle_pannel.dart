import 'package:flutter/material.dart';

import '../entity/entity.dart';

/// 中间面板
class MiddlePanel extends StatelessWidget {
  /// 模拟服务View
  final InfoDetailView view;

  const MiddlePanel({required this.view});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue[50],
      height: 36,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          //
          TextButton(
            child: Text('重载响应文件列表'),
            onPressed: () {
              // BlocProvider.of<InfoDetailBloc>(context)
              //     .add(InfoDetailReloadResponseEvent());
            },
          ),
        ],
      ),
    );
  }
}
