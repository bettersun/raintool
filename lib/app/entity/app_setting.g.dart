// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSetting _$$_AppSettingFromJson(Map<String, dynamic> json) =>
    _$_AppSetting(
      naviItemList: (json['naviItemList'] as List<dynamic>?)
              ?.map((e) => NaviItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      menuItemList: (json['menuItemList'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AppSettingToJson(_$_AppSetting instance) =>
    <String, dynamic>{
      'naviItemList': instance.naviItemList,
      'menuItemList': instance.menuItemList,
    };

_$_NaviItem _$$_NaviItemFromJson(Map<String, dynamic> json) => _$_NaviItem(
      index: json['index'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
      tooltip: json['tooltip'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NaviItemToJson(_$_NaviItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'label': instance.label,
      'flag': instance.flag,
      'tooltip': instance.tooltip,
      'enabled': instance.enabled,
    };

_$_MenuItem _$$_MenuItemFromJson(Map<String, dynamic> json) => _$_MenuItem(
      index: json['index'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
      tooltip: json['tooltip'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MenuItemToJson(_$_MenuItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'label': instance.label,
      'flag': instance.flag,
      'tooltip': instance.tooltip,
      'enabled': instance.enabled,
    };
