import '../entity/app_setting.dart';

abstract class AppRepository {
  Future<String> helloWorld();

  Future<List<NaviItem>> loadMenu();
}
