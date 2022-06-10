// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSetting _$$_AppSettingFromJson(Map<String, dynamic> json) =>
    _$_AppSetting(
      naviItemList: (json['naviItemList'] as List<dynamic>?)
              ?.map((e) => BMenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      menuItemList: (json['menuItemList'] as List<dynamic>?)
              ?.map((e) => BMenuItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedNaviIndex: json['selectedNaviIndex'] as int? ?? 0,
      selectedMenuIndex: json['selectedMenuIndex'] as int? ?? 0,
      showNavibar: json['showNavibar'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AppSettingToJson(_$_AppSetting instance) =>
    <String, dynamic>{
      'naviItemList': instance.naviItemList,
      'menuItemList': instance.menuItemList,
      'selectedNaviIndex': instance.selectedNaviIndex,
      'selectedMenuIndex': instance.selectedMenuIndex,
      'showNavibar': instance.showNavibar,
    };

_$_BMenuItem _$$_BMenuItemFromJson(Map<String, dynamic> json) => _$_BMenuItem(
      orderNum: json['orderNum'] as int? ?? 0,
      label: json['label'] as String? ?? '',
      flag: json['flag'] as String? ?? '',
      tooltip: json['tooltip'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      naviItem: json['naviItem'] as bool? ?? false,
      naviOrder: json['naviOrder'] as int? ?? 0,
    );

Map<String, dynamic> _$$_BMenuItemToJson(_$_BMenuItem instance) =>
    <String, dynamic>{
      'orderNum': instance.orderNum,
      'label': instance.label,
      'flag': instance.flag,
      'tooltip': instance.tooltip,
      'enabled': instance.enabled,
      'naviItem': instance.naviItem,
      'naviOrder': instance.naviOrder,
    };
