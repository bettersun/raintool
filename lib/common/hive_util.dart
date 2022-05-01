import 'package:hive_flutter/adapters.dart';

class HiveUtil {
  static const String appBoxName = "AppBox";

  static Future<void> initBox() async {
    await Hive.initFlutter();
  }

  static Future<void> openAppBox() async {
    await Hive.openBox(appBoxName);
  }

  static Box appBox() {
    return Hive.box(appBoxName);
  }
}
