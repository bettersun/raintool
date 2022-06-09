import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting.freezed.dart';
part 'app_setting.g.dart';

/// 应用设定
@freezed
class AppSetting with _$AppSetting {
  const factory AppSetting({
    @Default([]) List<NaviItem> naviItemList, // 底边栏项目列表
    @Default([]) List<BMenuItem> menuItemList, // 菜单项目列表
    @Default(0) int naviItemIndex,
    @Default(0) int menuItemIndex,
    @Default(true) bool showNavibar, // 显示底边栏标志
  }) = _AppSetting;

  factory AppSetting.fromJson(Map<String, Object?> json) => _$AppSettingFromJson(json);
}

/// 底边栏项目
@freezed
class NaviItem with _$NaviItem {
  const factory NaviItem({
    @JsonKey(ignore: true) @Default(0) int index, // 下标
    @Default(0) int orderNum, // 顺序
    @Default('') String label, // 标题
    @JsonKey(ignore: true) IconData? icon, // 图标
    @Default('') String flag, // 标志
    @Default('') String tooltip, // 提示信息
    @Default(false) bool enabled, // 可用
  }) = _NaviItem;

  factory NaviItem.fromJson(Map<String, Object?> json) => _$NaviItemFromJson(json);
}

/// 菜单项目
@freezed
class BMenuItem with _$BMenuItem {
  const factory BMenuItem({
    @JsonKey(ignore: true) @Default(0) int index, // 下标
    @Default(0) int orderNum, // 顺序
    @Default('') String label, // 标题
    @JsonKey(ignore: true) IconData? icon, // 图标
    @Default('') String flag, // 标志
    @Default('') String tooltip, // 提示信息
    @Default(false) bool enabled, // 可用
  }) = _BMenuItem;

  factory BMenuItem.fromJson(Map<String, Object?> json) => _$BMenuItemFromJson(json);
}
