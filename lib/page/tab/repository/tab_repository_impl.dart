import 'package:raintool/page/tab/entity/tab_info.dart';

import 'tab_repository.dart';

class TabRepositoryImpl extends TabRepository {
  @override
  Future<TabInfo> loadTabItemList() async {
    return const TabInfo(tabItemList: [
      TabItem(flag: '关注'),
      TabItem(flag: '推荐'),
      TabItem(flag: '热点'),
      TabItem(flag: '前端'),
      TabItem(flag: '后端'),
      TabItem(flag: '人工智能'),
      TabItem(flag: 'AAAAAA'),
      TabItem(flag: 'BBBBBB'),
      TabItem(flag: 'CCCCCC'),
      TabItem(flag: 'DDDDDD'),
      TabItem(flag: 'EEEEEE'),
    ]);
  }
  //
}
