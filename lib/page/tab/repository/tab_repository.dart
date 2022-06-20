import '../entity/tab_info.dart';

abstract class TabRepository {
  //
  Future<TabInfo> loadTabItemList();
}
