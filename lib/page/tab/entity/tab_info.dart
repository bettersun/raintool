import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tab_content.dart';

part 'tab_info.freezed.dart';
part 'tab_info.g.dart';

/// 标签信息
@freezed
class TabInfo with _$TabInfo {
  const factory TabInfo({
    @Default('') String code, // 状态码
    @Default('') String message, // 消息
    @Default([]) List<TabItem> tabItemList, // 标签项目列表
    @Default(0) int selectedTabIndex, // 选中的标签下标
  }) = _TabInfo;

  factory TabInfo.fromJson(Map<String, Object?> json) => _$TabInfoFromJson(json);
}

/// 标签项目
@freezed
class TabItem with _$TabItem {
  const factory TabItem({
    @Default('') String flag, //  标签标志
    @Default('') String tooltip, // 标签提示信息
    @JsonKey(ignore: true) @Default(null) IconData? iconData, // 标签图标
  }) = _TabItem;

  factory TabItem.fromJson(Map<String, Object?> json) => _$TabItemFromJson(json);
}
