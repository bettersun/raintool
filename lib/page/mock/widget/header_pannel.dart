import 'package:flutter/material.dart';

import '../entity/vm.dart';
import '../theme_const.dart';
import 'widget.dart';

/// Header面板
class HeaderPanel extends StatefulWidget {
  /// 模拟服务View
  final MockServiceView view;

  const HeaderPanel({required this.view});

  @override
  _HeaderPanelState createState() {
    return _HeaderPanelState();
  }
}

class _HeaderPanelState extends State<HeaderPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WidgetUtil.label('默认目标主机'),
          // 默认目标主机下拉框
          DropdownButton<String>(
            value: widget.view.defaultTargetHost,
            onChanged: (value) {
              if (value != widget.view.defaultTargetHost) {
                // TODO
                // BlocProvider.of<MockServiceBloc>(context).add(
                //   MockServiceChangeItemValueEvent(
                //     key: MockServiceItemKey.defaultTargetHost,
                //     newVal: value,
                //   ),
                // );
              }
            },
            items: widget.view.targetHostList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // IconButton(
          //   icon: Icon(Icons.settings),
          //   onPressed: () {
          //     print('设置');
          //   },
          // ),
        ],
      ),
    );
  }
}
