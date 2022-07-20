import '../entity/tab_info.dart';
import 'tab_repository.dart';

class TabRepositoryImpl extends TabRepository {
  @override
  Future<TabInfo> loadTabItemList() async {
    return const TabInfo(
      enabledTabList: [
        TabItem(flag: '关注', enable: true),
        TabItem(flag: '推荐', enable: true),
        TabItem(flag: '热点', enable: true),
        TabItem(flag: '恐龙', enable: true),
        TabItem(flag: '历史', enable: true),
        TabItem(flag: '未来', enable: true),
        TabItem(flag: '科技', enable: true),
        TabItem(flag: '天文', enable: true),
        TabItem(flag: '物理', enable: true),
        TabItem(flag: '化学', enable: true),
        TabItem(flag: '音乐', enable: true),
        TabItem(flag: '弈棋', enable: true),
      ],
      disabledTabList: [
        TabItem(flag: '动物', enable: false),
        TabItem(flag: '植物', enable: false),
        TabItem(flag: '微生物', enable: false),
        TabItem(flag: '百科', enable: false),
      ],
    );
  }
  //
}
