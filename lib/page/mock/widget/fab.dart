import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

/// 模拟服务信息Card
class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      curve: Curves.bounceIn,
      // marginBottom: ThemeConst.marginFABBottom,
      children: [
        // 重新加载模拟服务信息
        SpeedDialChild(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.cyan,
          onTap: () {
            // 触发事件 TODO
            // BlocProvider.of<MockServiceBloc>(context).add(MockServiceReloadEvent());
          },
          label: '重新加载模拟服务信息',
          labelStyle: TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.cyan,
        ),
        // 保存模拟服务信息
        SpeedDialChild(
          child: Icon(Icons.save),
          backgroundColor: Colors.indigo,
          onTap: () {
            // 触发事件 TODO
            // BlocProvider.of<MockServiceBloc>(context).add(MockServiceSaveEvent());
          },
          label: '保存模拟服务信息',
          labelStyle: TextStyle(color: Colors.white),
          labelBackgroundColor: Colors.indigo,
        ),
        // // 添加模拟服务信息
        // SpeedDialChild(
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.blueAccent[200],
        //   onTap: () {
        //     // 添加模拟服务信息
        //     // Push
        //   },
        //   label: '添加模拟服务信息',
        //   labelStyle: TextStyle(color: Colors.white),
        //   labelBackgroundColor: Colors.blueAccent[200],
        // ),
      ],
    );
  }
}
