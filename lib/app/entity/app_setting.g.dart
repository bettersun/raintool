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
              ?.map((e) => BMenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      naviItemIndex: json['naviItemIndex'] as int? ?? 0,
      menuItemIndex: json['menuItemIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AppSettingToJson(_$_AppSetting instance) =>
    <String, dynamic>{
      'naviItemList': instance.naviItemList,
      'menuItemList': instance.menuItemList,
      'naviItemIndex': instance.naviItemIndex,
      'menuItemIndex': instance.menuItemIndex,
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

_$_BMenuItem _$$_BMenuItemFromJson(Map<String, dynamic> json) => _$_BMenuItem(
      index: json['index'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
      tooltip: json['tooltip'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BMenuItemToJson(_$_BMenuItem instance) =>
    <String, dynamic>{
      'index': instance.index,
      'label': instance.label,
      'flag': instance.flag,
      'tooltip': instance.tooltip,
      'enabled': instance.enabled,
    };
