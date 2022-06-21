import '../entity/tab_info.dart';

abstract class TabRepository {
  // 加载标签项
  Future<TabInfo> loadTabItemList();
}
