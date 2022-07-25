import 'package:flutter/material.dart';

import '../entity/entity.dart';
import '../theme_const.dart';

/// 操作面板
class OperatePanel extends StatefulWidget {
  /// 模拟服务View
  final MockServiceView view;

  const OperatePanel({required this.view});

  @override
  _OperatePanelState createState() {
    return _OperatePanelState();
  }
}

/// 画面State
class _OperatePanelState extends State<OperatePanel> {
  // 搜索
  final TextEditingController _searchCtrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String toggleText = widget.view.isRunning ? '关闭服务' : '运行服务';
    final Color? toggleColor = widget.view.isRunning ? Colors.green[300] : Colors.deepOrangeAccent;

    return Container(
      alignment: Alignment.center,
      color: Colors.blue[50],
      padding: EdgeInsets.all(ThemeConst.sideWidth),
      child: Row(
        // 用于左右两端表示组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // 启动服务/关闭服务
              FlatButton(
                color: toggleColor,
                child: Text(
                  toggleText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  // 触发事件
                  // BlocProvider.of<MockServiceBloc>(context).add(MockServiceToggleServiceEvent());
                },
              ),
              // 搜索栏
              Container(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 32, maxWidth: 360),
                  child: TextField(
                    controller: _searchCtrlr,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 0, right: 12.0, bottom: 0.0, top: 0.0),
                      hintText: '搜索',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.blue[100],
                    ),
                    onChanged: (value) {
                      // 触发事件
                      // BlocProvider.of<MockServiceBloc>(context).add(MockServiceSearchEvent(keyword: value));
                    },
                  ),
                ),
              ),
            ],
          ),
          // 全部返回200
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: ThemeConst.marginButton, right: ThemeConst.marginButton),
                child: FlatButton(
                  color: Colors.blue[200],
                  child: Text('全部返回200'),
                  onPressed: () {
                    // BlocProvider.of<MockServiceBloc>(context).add(MockServiceAllResponseOKEvent());
                  },
                ),
              ),
              // 全部使用默认目标主机
              Container(
                margin: EdgeInsets.only(left: ThemeConst.marginButton, right: ThemeConst.marginButton),
                child: Row(
                  children: [
                    Text('默认目标主机'),
                    Switch(
                      value: widget.view.allUseDefaultTargetHost,
                      onChanged: widget.view.allUseMockService
                          ? null // 使用模拟服务时，无需设置 是否使用默认目标主机
                          : (value) {
                              // 触发事件
                              // BlocProvider.of<MockServiceBloc>(context).add(MockServiceAllUseDefaultTargetHostEvent(
                              //   allUseDefaultTargetHost: value,
                              // ));
                            },
                    ),
                  ],
                ),
              ),
              // 全部使用模拟服务
              Container(
                margin: EdgeInsets.only(left: ThemeConst.marginButton, right: ThemeConst.marginButton),
                child: Row(
                  children: [
                    Text('模拟服务'),
                    Switch(
                      value: widget.view.allUseMockService,
                      onChanged: (value) {
                        // 触发事件
                        // BlocProvider.of<MockServiceBloc>(context).add(MockServiceAllUseMockServiceEvent(
                        //   allUseMockService: value,
                        // ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
