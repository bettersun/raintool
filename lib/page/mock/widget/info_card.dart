import 'package:flutter/material.dart';

import '../entity/vm.dart';
import '../theme_const.dart';

/// 模拟服务信息Card
class InfoCard extends StatelessWidget {
  /// 下标
  final int index;

  /// 模拟服务信息View
  final MockServiceInfoView infoView;

  const InfoCard({Key? key, required this.index, required this.infoView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int firstIndex = 1;
    return Card(
      margin: index == firstIndex
          ? EdgeInsets.all(ThemeConst.sideWidth)
          : EdgeInsets.only(left: ThemeConst.sideWidth, right: ThemeConst.sideWidth, bottom: ThemeConst.sideWidth),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          color: index % 2 == 1 ? Colors.transparent : Colors.blue[50],
        ),
        child: Row(
          children: [
            Container(
              color: Colors.blue[100],
              margin: ThemeConst.cellMarginLR,
              padding: ThemeConst.cellPadding,
              child: Text(index.toString()),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: ThemeConst.cellMarginLR,
                padding: ThemeConst.cellPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: '说明',
                      preferBelow: false,
                      verticalOffset: 10,
                      child: Text(infoView.description),
                    ),
                    Tooltip(
                      message: 'URL',
                      preferBelow: false,
                      verticalOffset: 10,
                      child: Text(infoView.url),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: ThemeConst.cellMarginLR,
                padding: ThemeConst.cellPadding,
                child: Tooltip(
                  message: '请求方法',
                  preferBelow: false,
                  verticalOffset: 10,
                  child: Text(infoView.method),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: ThemeConst.cellMarginLR,
                padding: ThemeConst.cellPadding,
                child: Tooltip(
                  message: '目标主机',
                  preferBelow: false,
                  verticalOffset: 10,
                  child: Text(
                    infoView.currentTargetHost,
                    // 使用模拟服务时，字体颜色为灰色
                    style: TextStyle(
                      color: infoView.useMockService ? Colors.grey : Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            // 响应状态码
            Expanded(
              flex: 1,
              child: Container(
                margin: ThemeConst.cellMarginLR,
                padding: ThemeConst.cellPaddingLR,
                child: Tooltip(
                  message: '响应状态码',
                  preferBelow: false,
                  verticalOffset: 10,
                  child: DropdownButton<String>(
                    value: infoView.statusCode.toString(),
                    disabledHint: Text(infoView.statusCode.toString()),
                    onChanged: !infoView.useMockService
                        ? null // 不使用模拟服务时，禁用下拉框
                        : (value) {
                            if (value != infoView.statusCode.toString()) {
                              // 触发事件 TODO
                              // BlocProvider.of<MockServiceBloc>(context).add(
                              //   MockServiceChangeListValueEvent(
                              //     infoView: infoView,
                              //     key: MockServiceItemKey.infoListStatusCode,
                              //     newVal: value,
                              //   ),
                              // );
                            }
                          },
                    isExpanded: true,
                    items: infoView.statusCodeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // 响应文件
            Expanded(
              flex: 3,
              child: Container(
                margin: ThemeConst.cellMarginLR,
                padding: ThemeConst.cellPadding,
                child: Tooltip(
                  message: '响应文件',
                  preferBelow: false,
                  verticalOffset: 10,
                  child: Text(
                    infoView.responseFile,
                    // 使用模拟服务时，字体颜色为灰色
                    style: TextStyle(
                      color: infoView.useMockService ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            // 使用默认目标主机
            Row(
              children: [
                Container(
                  height: 20,
                  child: Tooltip(
                    message: '使用默认目标主机',
                    preferBelow: false,
                    verticalOffset: 10,
                    child: Row(
                      children: [
                        Text('默认目标主机'),
                        Switch(
                          value: infoView.useDefaultTargetHost,
                          onChanged: infoView.useMockService
                              ? null // 使用模拟服务时，无需设置 是否使用默认目标主机
                              : (value) {
                                  // 触发事件 TODO
                                  // BlocProvider.of<MockServiceBloc>(context).add(MockServiceChangeListValueEvent(
                                  //   infoView: infoView,
                                  //   key: MockServiceItemKey.infoListUseDefaultTargetHost,
                                  //   newVal: value,
                                  // ));
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                // 使用模拟服务
                Container(
                  height: 20,
                  child: Tooltip(
                    message: '使用模拟服务',
                    preferBelow: false,
                    verticalOffset: 10,
                    child: Row(
                      children: [
                        Text('模拟服务'),
                        Switch(
                          value: infoView.useMockService,
                          onChanged: (value) {
                            // 触发事件 TODO
                            // BlocProvider.of<MockServiceBloc>(context).add(MockServiceChangeListValueEvent(
                            //   infoView: infoView,
                            //   key: MockServiceItemKey.infoListUseMockService,
                            //   newVal: value,
                            // ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: ThemeConst.cellMarginLR,
              child: Tooltip(
                message: '详细',
                preferBelow: false,
                verticalOffset: 10,
                child: InkWell(
                  child: Icon(Icons.arrow_right),
                  onTap: () async {
                    // 详细
                    // await Navigator.of(context).push<dynamic>(
                    //   MaterialPageRoute<dynamic>(builder: (_) {
                    //     return InfoDetailPage(infoView: infoView);
                    //   }),
                    // ).then((value) {
                    //   // 更新模拟服务信息
                    //   BlocProvider.of<MockServiceBloc>(context)
                    //       .add(MockServiceUpdateInfoEvent(infoView: value as MockServiceInfoView));
                    // });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
