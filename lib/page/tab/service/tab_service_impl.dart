import '../entity/tab_info.dart';
import 'tab_service.dart';

class TabServiceImpl extends TabService {
  //
  @override
  Future<TabInfo> init() async {
    return const TabInfo(tabItemList: [
      TabItem(flag: '关注'),
      TabItem(flag: '推荐'),
      TabItem(flag: '热点'),
    ]);
  }
}
