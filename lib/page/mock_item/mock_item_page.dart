import 'package:flutter/material.dart';
import 'package:raintool/page/mock_item/entity/info_detail_view.dart';

import '../mock/entity/entity.dart';
import 'widget/widget.dart';

/// 模拟服务信息详细画面
class MockItemPage extends StatefulWidget {
  /// 模拟服务信息View
  final MockServiceInfoView infoView;

  const MockItemPage({required this.infoView});

  @override
  _InfoDetailPageState createState() {
    return _InfoDetailPageState();
  }
}

/// 画面State
class _InfoDetailPageState extends State<MockItemPage> {
  // InfoDetailBloc _bloc;

  @override
  void initState() {
    super.initState();

    // _bloc = InfoDetailBloc();
    //
    // // 初始化
    // _bloc.add(InfoDetailInitEvent(infoView: widget.infoView));
  }

  @override
  Widget build(BuildContext context) {
    InfoDetailView view = InfoDetailView();
    // return BlocProvider(
    //   create: (BuildContext context) => _bloc,
    //   child: BlocBuilder<InfoDetailBloc, InfoDetailState>(
    //       builder: (context, state) {
    // 加载完成后，渲染
    // if (state is InfoDetailDoneState) {
    // 构建组件
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text('模拟服务信息详细'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // 模拟服务信息详细View转模拟服务信息View
              final MockServiceInfoView infoView = MockServiceInfoView(
                url: view.url,
                method: view.method,
                targetHost: view.targetHost,
                currentTargetHost: view.currentTargetHost,
                useDefaultTargetHost: view.useDefaultTargetHost,
                useMockService: view.useMockService,
                statusCode: view.statusCode,
                statusCodeList: view.statusCodeList,
                responseFile: view.responseFile,
                visible: true,
                description: view.description,
              );

              // Pop
              Navigator.maybePop(context, infoView);
            },
          ),
        ),
        preferredSize: Size.fromHeight(32),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Theme.of(context).bannerTheme.backgroundColor,
        child: Column(
          children: [
            // Header面板
            HeaderPanel(view: view),
            // 中间面板
            MiddlePanel(view: view),
            // 详细面板
            Expanded(
              child: DetailPanel(view: view),
            ),
            // 状态栏面板
            StatusPannel(view: view),
          ],
        ),
      ),
    );
    // }

    //         return Container();
    //       }),
    // );
  }
}
