import 'package:flutter/material.dart';

import '../entity/entity.dart';
import 'response_card.dart';

/// 详细面板
class DetailPanel extends StatelessWidget {
  /// 模拟服务信息详细View
  final InfoDetailView view;

  const DetailPanel({required this.view});

  @override
  Widget build(BuildContext context) {
    Widget result = Container();

    // 详细信息
    result = SingleChildScrollView(
      child: Column(
        children: buildList(),
      ),
    );

    return Container(
      color: Colors.blue[100],
      width: double.infinity,
      child: result,
    );
  }

  /// 构建模拟服务信息详细信息Card列表
  List<Widget> buildList() {
    final List<ResponseCard> responseCardList = [];
    for (int i = 0; i < view.responseList.length; i++) {
      //
      responseCardList.add(ResponseCard(
        index: i,
        responseView: view.responseList[i],
        responseFile: view.responseFile,
      ));
    }

    return responseCardList;
  }
}
