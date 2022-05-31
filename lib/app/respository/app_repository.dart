import '../entity/app_setting.dart';

abstract class AppRepository {
  Future<String> helloWorld();

  /// 加载底边栏项目
  Future<List<NaviItem>> loadNaviMenu();

  /// 加载菜单项目
  Future<List<BMenuItem>> loadMenu();
}
