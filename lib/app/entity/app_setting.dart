import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'app_setting.freezed.dart';
part 'app_setting.g.dart';

/// 应用设定
@freezed
class AppSetting with _$AppSetting {
  const factory AppSetting({
    @Default([]) List<NaviItem> naviItemList, // 底边栏项目列表
    @Default([]) List<MenuItem> menuItemList, // 菜单项目列表
  }) = _AppSetting;

  factory AppSetting.fromJson(Map<String, Object?> json) => _$AppSettingFromJson(json);
}

/// 底边栏项目
@freezed
class NaviItem with _$NaviItem {
  const factory NaviItem({
    @Default(0) int index, //  下标
    @Default('') String label, // 标题
    @Default('') String flag, // 标志
    @Default('') String tooltip, // 提示信息
    @Default(false) bool enabled, // 可用
  }) = _NaviItem;

  factory NaviItem.fromJson(Map<String, Object?> json) => _$NaviItemFromJson(json);
}

/// 菜单项目
@freezed
class MenuItem with _$MenuItem {
  const factory MenuItem({
    @Default(0) int index, //  下标
    @Default('') String label, // 标题
    @Default('') String flag, // 标志
    @Default('') String tooltip, // 提示信息
    @Default(false) bool enabled, // 可用
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, Object?> json) => _$MenuItemFromJson(json);
}
