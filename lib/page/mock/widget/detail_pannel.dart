import 'package:flutter/material.dart';

import '../entity/vm.dart';
import '../theme_const.dart';
import 'info_card.dart';

/// 详细面板
class DetailPanel extends StatelessWidget {
  /// 模拟服务View
  final MockServiceView view;

  const DetailPanel({required this.view});

  @override
  Widget build(BuildContext context) {
    Widget result = Container();

    // 详细信息
    result = SingleChildScrollView(
      child: Column(
        children: buildInfoList(),
      ),
    );

    return Container(
      color: Colors.blue[100],
      width: double.infinity,
      child: result,
    );
  }

  /// 构建模拟服务信息Card列表
  List<Widget> buildInfoList() {
    final List<Widget> infoCardList = [];
    int i = 0;
    for (final MockServiceInfoView v in view.infoList) {
      if (v.visible) {
        i++;

        // 各数据Card
        infoCardList.add(InfoCard(
          index: i,
          infoView: v,
        ));
      }
    }

    // 防止 FAB 遮挡
    infoCardList.add(Container(height: ThemeConst.paddingFABListBottom));

    return infoCardList;
  }
}
