import 'package:flutter/material.dart';

/// 主题常量
class ThemeConst {
  static const double sideWidth = 4.0;

  static const double paddingItem = 4.0;
  static const double paddingFABListBottom = 60.0;

  static const double paddingCell = 4.0;
  static const double marginCell = 2.0;

  static const double marginButton = 4.0;
  static const double marginFABBottom = 32.0;

  static const double heightAppBar = 40;
  static const double heightInfoBar = 30;

  static const double len0 = 2.0;
  static const double len1 = 4.0;
  static const double len2 = 8.0;
  static const double len3 = 12.0;
  static const double len4 = 16.0;
  static const double len5 = 20.0;

  static const Color colorDisabled = Colors.grey;

  static const cellMarginLR = EdgeInsets.only(
      left: ThemeConst.marginCell, right: ThemeConst.marginCell);
  static const cellPaddingLR = EdgeInsets.only(
      left: ThemeConst.paddingCell, right: ThemeConst.paddingCell);

  static const cellMargin = EdgeInsets.all(ThemeConst.marginCell);
  static const cellPadding = EdgeInsets.all(ThemeConst.paddingCell);
}
