import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_content.freezed.dart';
part 'tab_content.g.dart';

/// 标签内容
@freezed
class TabContent with _$TabContent {
  const factory TabContent({
    @Default([]) List<TabContentItem> tabContentItemList, // 标签内容项目列表
    @Default('') String contentType, // 标签内容类型
  }) = _TabContent;

  factory TabContent.fromJson(Map<String, Object?> json) => _$TabContentFromJson(json);
}

/// 标签内容项目
@freezed
class TabContentItem with _$TabContentItem {
  const factory TabContentItem({
    @Default('') String content, // 内容
    @Default('') String code, //  代码
    @Default(null) DateTime? datetime, // 时间
  }) = _TabContentItem;

  factory TabContentItem.fromJson(Map<String, Object?> json) => _$TabContentItemFromJson(json);
}
