import 'package:flutter/material.dart';

import '../const.dart';
import '../const/router_const.dart';

class AppUtil {
  /// 图标
  static IconData loadIconData(String flag) {
    if (flag == MenuConst.toggleNavi) {
      return Icons.threed_rotation_outlined;
    }
    if (flag == MenuConst.home) {
      return Icons.home;
    }
    if (flag == MenuConst.todo) {
      return Icons.email;
    }
    if (flag == 'address') {
      return Icons.airplay;
    }
    if (flag == MenuConst.pages) {
      return Icons.pages;
    }
    if (flag == MenuConst.setting) {
      return Icons.settings;
    }

    return Icons.home;
  }

  /// 路由路径
  static String routerPath(String flag) {
    if (flag == MenuConst.home) {
      return RouterConst.pathHome;
    }
    if (flag == MenuConst.todo) {
      return RouterConst.pathTodo;
    }
    if (flag == 'address') {
      return RouterConst.pathHome;
    }
    if (flag == MenuConst.pages) {
      return RouterConst.pathScrollable;
    }
    if (flag == MenuConst.setting) {
      return RouterConst.pathSetting;
    }

    return RouterConst.pathHome;
  }
}
