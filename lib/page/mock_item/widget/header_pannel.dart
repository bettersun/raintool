import 'package:flutter/material.dart';

import '../entity/info_detail_view.dart';

/// Header面板
class HeaderPanel extends StatefulWidget {
  /// 模拟服务信息详细View
  final InfoDetailView view;

  const HeaderPanel({required this.view});

  @override
  _HeaderPanelState createState() {
    return _HeaderPanelState();
  }
}

/// 画面State
class _HeaderPanelState extends State<HeaderPanel> {
  // URL
  final TextEditingController _urlCtrlr = TextEditingController();
  // 请求方法
  final TextEditingController _methodCtrlr = TextEditingController();
  // 目标主机
  final TextEditingController _targetHostPathCtrlr = TextEditingController();
  // 响应文件
  final TextEditingController _responseFileCtrlr = TextEditingController();
  // 说明
  final TextEditingController _descriptionCtrlr = TextEditingController();

  // 目标主机
  TextFormField? inputTargetHost;

  @override
  void initState() {
    super.initState();
    // URL
    _urlCtrlr.text = widget.view.url;
    // 请求方法
    _methodCtrlr.text = widget.view.method;
    // 目标主机
    _targetHostPathCtrlr.text = widget.view.targetHost;
    // 说明
    _descriptionCtrlr.text = widget.view.description;
  }

  @override
  Widget build(BuildContext context) {
    // 响应文件
    _responseFileCtrlr.text = widget.view.responseFile;

    const String lblTxtTargetHost = '目标主机';

    // 目标主机是否可用
    final bool isTargetHostEnabled = !widget.view.useMockService && !widget.view.useDefaultTargetHost;
    final Color colorTargetHost = isTargetHostEnabled ? Colors.green : Colors.grey;

    // 使用默认目标主机时
    if (widget.view.useDefaultTargetHost) {
      inputTargetHost = TextFormField(
        style: TextStyle(
          color: colorTargetHost,
        ),
        decoration: InputDecoration(
          labelText: lblTxtTargetHost,
        ),
        controller: TextEditingController(text: widget.view.currentTargetHost),
        // 使用默认目标主机时，不可编辑
        enabled: isTargetHostEnabled,
      );
    } else {
      // 不使用默认目标主机时
      inputTargetHost = TextFormField(
        style: TextStyle(
          color: colorTargetHost,
        ),
        decoration: InputDecoration(
          labelText: lblTxtTargetHost,
        ),
        controller: _targetHostPathCtrlr,
        // 使用默认目标主机时，不可编辑
        enabled: isTargetHostEnabled,
        onChanged: (value) {
          // BlocProvider.of<InfoDetailBloc>(context).add(InfoDetailChangeItemValueEvent(
          //   key: InfoDetailItemKey.targetHost,
          //   newVal: value,
          // ));
        },
      );
    }

    return Container(
      color: Colors.blue[200],
      padding: EdgeInsets.all(8 * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    // 不能编辑
                    enabled: false,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                      labelText: 'URL',
                    ),
                    controller: _urlCtrlr,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    // 不能编辑
                    enabled: false,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                      labelText: '请求方法',
                    ),
                    controller: _methodCtrlr,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  // color: widget.view.useMockService
                  //     ? Colors.transparent
                  //     : Colors.grey,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: '响应状态码',
                    ),
                    value: widget.view.statusCode.toString(),
                    disabledHint: Text(widget.view.statusCode.toString()),
                    onChanged: !widget.view.useMockService
                        ? null // 不使用模拟服务时，禁用下拉框
                        : (value) {
                            if (value != widget.view.statusCode.toString()) {
                              // 触发事件
                              // BlocProvider.of<InfoDetailBloc>(context).add(
                              //   InfoDetailChangeItemValueEvent(
                              //     key: InfoDetailItemKey.statusCode,
                              //     newVal: value,
                              //   ),
                              // );
                            }
                          },
                    // isExpanded: true,
                    items: widget.view.statusCodeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: '说明',
                    ),
                    controller: _descriptionCtrlr,
                    onChanged: (value) {
                      // 触发事件
                      // BlocProvider.of<InfoDetailBloc>(context).add(
                      //   InfoDetailChangeItemValueEvent(
                      //     key: InfoDetailItemKey.description,
                      //     newVal: value,
                      //   ),
                      // );
                    },
                  ),
                ),
              ),
              Container(
                height: 20,
                child: Row(
                  children: [
                    Text('模拟服务'),
                    Switch(
                      value: widget.view.useMockService,
                      onChanged: (value) {
                        // if (value != widget.view.useMockService) {
                        //   BlocProvider.of<InfoDetailBloc>(context).add(InfoDetailChangeItemValueEvent(
                        //     key: InfoDetailItemKey.useMockService,
                        //     newVal: value,
                        //   ));
                        // }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    // 不能编辑
                    enabled: false,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                      labelText: '响应文件',
                    ),
                    controller: _responseFileCtrlr,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: inputTargetHost,
                ),
              ),
              Container(
                height: 20,
                child: Row(
                  children: [
                    Text('默认目标主机'),
                    Switch(
                      value: widget.view.useDefaultTargetHost,
                      onChanged: widget.view.useMockService
                          ? null // 使用模拟服务时，无需修改
                          : (value) {
                              // if (value != widget.view.useDefaultTargetHost) {
                              //   BlocProvider.of<InfoDetailBloc>(context).add(InfoDetailChangeItemValueEvent(
                              //     key: InfoDetailItemKey.useDefaultTargetHost,
                              //     newVal: value,
                              //   ));
                              // }
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
