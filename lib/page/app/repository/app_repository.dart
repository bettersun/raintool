import '../entity/app_setting.dart';

abstract class AppRepository {
  Future<String> helloWorld();

  /// 加载菜单项目
  Future<List<BMenuItem>> loadMenu();
}
