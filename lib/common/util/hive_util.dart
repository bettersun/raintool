import 'package:hive_flutter/adapters.dart';

class HiveUtil {
  /// 应用的 Box 名
  static const String appBoxName = "AppBox";

  /// 初始化 Box（单例）
  static Future<void> initBox() async {
    await Hive.initFlutter();
  }

  /// 打开 Box（单例）
  static Future<void> openAppBox() async {
    await Hive.openBox(appBoxName);
  }

  /// 获取 Box（单例）
  static Box appBox() {
    return Hive.box(appBoxName);
  }
}
