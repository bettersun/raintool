// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TabContent _$$_TabContentFromJson(Map<String, dynamic> json) =>
    _$_TabContent(
      tabContentItemList: (json['tabContentItemList'] as List<dynamic>?)
              ?.map((e) => TabContentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contentType: json['contentType'] as String? ?? '',
    );

Map<String, dynamic> _$$_TabContentToJson(_$_TabContent instance) =>
    <String, dynamic>{
      'tabContentItemList': instance.tabContentItemList,
      'contentType': instance.contentType,
    };

_$_TabContentItem _$$_TabContentItemFromJson(Map<String, dynamic> json) =>
    _$_TabContentItem(
      content: json['content'] as String? ?? '',
      code: json['code'] as String? ?? '',
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
    );

Map<String, dynamic> _$$_TabContentItemToJson(_$_TabContentItem instance) =>
    <String, dynamic>{
      'content': instance.content,
      'code': instance.code,
      'datetime': instance.datetime?.toIso8601String(),
    };
