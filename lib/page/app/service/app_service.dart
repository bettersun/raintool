import '../entity/app_env.dart';
import '../entity/app_setting.dart';

abstract class AppService {
  /// 初始化
  Future<AppEnv> initAppEnv(AppEnv state);

  Future<String> rpcHello();

  /// 切换主题
  AppEnv toggleTheme(AppEnv state);

  /// 切换语言
  AppEnv changeLocale(AppEnv state);

  /// App 设定初始化
  Future<AppSetting> initAppSetting(AppSetting state);

  /// 切换底边栏
  AppSetting toggleNavibar(AppSetting state);

  /// 切换菜单项目
  AppSetting changeMenu(AppSetting state, int index);

  /// 切换底边栏项目
  AppSetting changeNavi(AppSetting state, int index);

  /// 重新排序菜单
  AppSetting reorderMenuItem(AppSetting state, int oldIndex, int newIndex);
}
