import 'package:flutter/material.dart';

import '../entity/entity.dart';

/// 模拟服务信息详细响应Card
class ResponseCard extends StatefulWidget {
  /// 下标
  final int index;

  /// 响应文件
  final String responseFile;

  /// 模拟服务信息详细View
  final DetailResponseView responseView;

  const ResponseCard({required this.index, required this.responseFile, required this.responseView});

  @override
  _ResponseCardState createState() => _ResponseCardState();
}

class _ResponseCardState extends State<ResponseCard> {
  // 重命名文件的控制器
  TextEditingController fileNameCtrlr = TextEditingController();
  // InfoDetailBloc bloc;

  @override
  void initState() {
    super.initState();

    // bloc = BlocProvider.of<InfoDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    fileNameCtrlr.text = widget.responseView.fileName;
    return Card(
      margin: widget.index == 0 ? EdgeInsets.all(8) : EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          color: widget.index % 2 == 0 ? Colors.transparent : Colors.blue[50],
        ),
        child: Row(
          children: [
            Container(
              color: Colors.blue[100],
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Text(widget.index.toString()),
            ),
            // 文件路径
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Text(widget.responseView.responseFile),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Text('设为响应'),
                  Radio(
                    groupValue: widget.responseFile,
                    value: widget.responseView.responseFile,
                    onChanged: (value) {
                      // 触发事件
                      // BlocProvider.of<InfoDetailBloc>(context)
                      //     .add(InfoDetailChangeListValueEvent(
                      //   key: InfoDetailItemKey.responseListIsResponse,
                      //   index: widget.index,
                      //   newVal: value,
                      // ));
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.blue[400]),
                onPressed: () async {
                  // 显示重命名对话框
                  await showRenameDialog();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 显示重命名对话框
  Future<void> showRenameDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('重命名文件'),
          content: Container(
            height: 100,
            width: 500,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                color: Colors.grey[100],
                child: Text(widget.responseView.fileName),
              ),
              TextFormField(
                controller: fileNameCtrlr,
              ),
            ]),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text('取消'),
              color: Colors.blue[200],
              textColor: Colors.white,
              onPressed: () {
                // 触发事件
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text('确定'),
              color: Colors.blue[400],
              textColor: Colors.white,
              onPressed: () {
                // 触发事件
                // bloc.add(InfoDetailRenameEvent(
                //   responseFile: widget.responseView.responseFile,
                //   newFileName: fileNameCtrlr.value.text,
                // ));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
