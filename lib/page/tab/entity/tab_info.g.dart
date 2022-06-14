// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TabInfo _$$_TabInfoFromJson(Map<String, dynamic> json) => _$_TabInfo(
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
      tabItemList: (json['tabItemList'] as List<dynamic>?)
              ?.map((e) => TabItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedTabIndex: json['selectedTabIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TabInfoToJson(_$_TabInfo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'tabItemList': instance.tabItemList,
      'selectedTabIndex': instance.selectedTabIndex,
    };

_$_TabItem _$$_TabItemFromJson(Map<String, dynamic> json) => _$_TabItem(
      flag: json['flag'] as String? ?? '',
      tooltip: json['tooltip'] as String? ?? '',
    );

Map<String, dynamic> _$$_TabItemToJson(_$_TabItem instance) =>
    <String, dynamic>{
      'flag': instance.flag,
      'tooltip': instance.tooltip,
    };
