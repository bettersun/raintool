import 'package:flutter/material.dart';

class AppUtil {
  /// 图标
  static IconData loadIconData(String flag) {
    if (flag == 'home') {
      return Icons.home;
    }
    if (flag == 'email') {
      return Icons.email;
    }
    if (flag == 'address') {
      return Icons.airplay;
    }
    if (flag == 'pages') {
      return Icons.pages;
    }
    if (flag == 'setting') {
      return Icons.settings;
    }

    return Icons.home;
  }
}
