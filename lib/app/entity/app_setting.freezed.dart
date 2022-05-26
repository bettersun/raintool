// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSetting _$AppSettingFromJson(Map<String, dynamic> json) {
  return _AppSetting.fromJson(json);
}

/// @nodoc
mixin _$AppSetting {
  List<NaviItem> get naviItemList =>
      throw _privateConstructorUsedError; // 底边栏项目列表
  List<MenuItem> get menuItemList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingCopyWith<AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingCopyWith<$Res> {
  factory $AppSettingCopyWith(
          AppSetting value, $Res Function(AppSetting) then) =
      _$AppSettingCopyWithImpl<$Res>;
  $Res call({List<NaviItem> naviItemList, List<MenuItem> menuItemList});
}

/// @nodoc
class _$AppSettingCopyWithImpl<$Res> implements $AppSettingCopyWith<$Res> {
  _$AppSettingCopyWithImpl(this._value, this._then);

  final AppSetting _value;
  // ignore: unused_field
  final $Res Function(AppSetting) _then;

  @override
  $Res call({
    Object? naviItemList = freezed,
    Object? menuItemList = freezed,
  }) {
    return _then(_value.copyWith(
      naviItemList: naviItemList == freezed
          ? _value.naviItemList
          : naviItemList // ignore: cast_nullable_to_non_nullable
              as List<NaviItem>,
      menuItemList: menuItemList == freezed
          ? _value.menuItemList
          : menuItemList // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_AppSettingCopyWith<$Res>
    implements $AppSettingCopyWith<$Res> {
  factory _$$_AppSettingCopyWith(
          _$_AppSetting value, $Res Function(_$_AppSetting) then) =
      __$$_AppSettingCopyWithImpl<$Res>;
  @override
  $Res call({List<NaviItem> naviItemList, List<MenuItem> menuItemList});
}

/// @nodoc
class __$$_AppSettingCopyWithImpl<$Res> extends _$AppSettingCopyWithImpl<$Res>
    implements _$$_AppSettingCopyWith<$Res> {
  __$$_AppSettingCopyWithImpl(
      _$_AppSetting _value, $Res Function(_$_AppSetting) _then)
      : super(_value, (v) => _then(v as _$_AppSetting));

  @override
  _$_AppSetting get _value => super._value as _$_AppSetting;

  @override
  $Res call({
    Object? naviItemList = freezed,
    Object? menuItemList = freezed,
  }) {
    return _then(_$_AppSetting(
      naviItemList: naviItemList == freezed
          ? _value._naviItemList
          : naviItemList // ignore: cast_nullable_to_non_nullable
              as List<NaviItem>,
      menuItemList: menuItemList == freezed
          ? _value._menuItemList
          : menuItemList // ignore: cast_nullable_to_non_nullable
              as List<MenuItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppSetting with DiagnosticableTreeMixin implements _AppSetting {
  const _$_AppSetting(
      {final List<NaviItem> naviItemList = const [],
      final List<MenuItem> menuItemList = const []})
      : _naviItemList = naviItemList,
        _menuItemList = menuItemList;

  factory _$_AppSetting.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingFromJson(json);

  final List<NaviItem> _naviItemList;
  @override
  @JsonKey()
  List<NaviItem> get naviItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_naviItemList);
  }

// 底边栏项目列表
  final List<MenuItem> _menuItemList;
// 底边栏项目列表
  @override
  @JsonKey()
  List<MenuItem> get menuItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItemList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppSetting(naviItemList: $naviItemList, menuItemList: $menuItemList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppSetting'))
      ..add(DiagnosticsProperty('naviItemList', naviItemList))
      ..add(DiagnosticsProperty('menuItemList', menuItemList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSetting &&
            const DeepCollectionEquality()
                .equals(other._naviItemList, _naviItemList) &&
            const DeepCollectionEquality()
                .equals(other._menuItemList, _menuItemList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_naviItemList),
      const DeepCollectionEquality().hash(_menuItemList));

  @JsonKey(ignore: true)
  @override
  _$$_AppSettingCopyWith<_$_AppSetting> get copyWith =>
      __$$_AppSettingCopyWithImpl<_$_AppSetting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingToJson(this);
  }
}

abstract class _AppSetting implements AppSetting {
  const factory _AppSetting(
      {final List<NaviItem> naviItemList,
      final List<MenuItem> menuItemList}) = _$_AppSetting;

  factory _AppSetting.fromJson(Map<String, dynamic> json) =
      _$_AppSetting.fromJson;

  @override
  List<NaviItem> get naviItemList => throw _privateConstructorUsedError;
  @override // 底边栏项目列表
  List<MenuItem> get menuItemList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingCopyWith<_$_AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

NaviItem _$NaviItemFromJson(Map<String, dynamic> json) {
  return _NaviItem.fromJson(json);
}

/// @nodoc
mixin _$NaviItem {
  int get index => throw _privateConstructorUsedError; //  下标
  String get label => throw _privateConstructorUsedError; // 标题
  String get flag => throw _privateConstructorUsedError; // 标志
  String get tooltip => throw _privateConstructorUsedError; // 提示信息
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NaviItemCopyWith<NaviItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NaviItemCopyWith<$Res> {
  factory $NaviItemCopyWith(NaviItem value, $Res Function(NaviItem) then) =
      _$NaviItemCopyWithImpl<$Res>;
  $Res call(
      {int index, String label, String flag, String tooltip, bool enabled});
}

/// @nodoc
class _$NaviItemCopyWithImpl<$Res> implements $NaviItemCopyWith<$Res> {
  _$NaviItemCopyWithImpl(this._value, this._then);

  final NaviItem _value;
  // ignore: unused_field
  final $Res Function(NaviItem) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_NaviItemCopyWith<$Res> implements $NaviItemCopyWith<$Res> {
  factory _$$_NaviItemCopyWith(
          _$_NaviItem value, $Res Function(_$_NaviItem) then) =
      __$$_NaviItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index, String label, String flag, String tooltip, bool enabled});
}

/// @nodoc
class __$$_NaviItemCopyWithImpl<$Res> extends _$NaviItemCopyWithImpl<$Res>
    implements _$$_NaviItemCopyWith<$Res> {
  __$$_NaviItemCopyWithImpl(
      _$_NaviItem _value, $Res Function(_$_NaviItem) _then)
      : super(_value, (v) => _then(v as _$_NaviItem));

  @override
  _$_NaviItem get _value => super._value as _$_NaviItem;

  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_$_NaviItem(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NaviItem with DiagnosticableTreeMixin implements _NaviItem {
  const _$_NaviItem(
      {this.index = 0,
      this.label = '',
      this.flag = '',
      this.tooltip = '',
      this.enabled = false});

  factory _$_NaviItem.fromJson(Map<String, dynamic> json) =>
      _$$_NaviItemFromJson(json);

  @override
  @JsonKey()
  final int index;
//  下标
  @override
  @JsonKey()
  final String label;
// 标题
  @override
  @JsonKey()
  final String flag;
// 标志
  @override
  @JsonKey()
  final String tooltip;
// 提示信息
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NaviItem(index: $index, label: $label, flag: $flag, tooltip: $tooltip, enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NaviItem'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('flag', flag))
      ..add(DiagnosticsProperty('tooltip', tooltip))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NaviItem &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.tooltip, tooltip) &&
            const DeepCollectionEquality().equals(other.enabled, enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(tooltip),
      const DeepCollectionEquality().hash(enabled));

  @JsonKey(ignore: true)
  @override
  _$$_NaviItemCopyWith<_$_NaviItem> get copyWith =>
      __$$_NaviItemCopyWithImpl<_$_NaviItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NaviItemToJson(this);
  }
}

abstract class _NaviItem implements NaviItem {
  const factory _NaviItem(
      {final int index,
      final String label,
      final String flag,
      final String tooltip,
      final bool enabled}) = _$_NaviItem;

  factory _NaviItem.fromJson(Map<String, dynamic> json) = _$_NaviItem.fromJson;

  @override
  int get index => throw _privateConstructorUsedError;
  @override //  下标
  String get label => throw _privateConstructorUsedError;
  @override // 标题
  String get flag => throw _privateConstructorUsedError;
  @override // 标志
  String get tooltip => throw _privateConstructorUsedError;
  @override // 提示信息
  bool get enabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NaviItemCopyWith<_$_NaviItem> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return _MenuItem.fromJson(json);
}

/// @nodoc
mixin _$MenuItem {
  int get index => throw _privateConstructorUsedError; //  下标
  String get label => throw _privateConstructorUsedError; // 标题
  String get flag => throw _privateConstructorUsedError; // 标志
  String get tooltip => throw _privateConstructorUsedError; // 提示信息
  bool get enabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuItemCopyWith<MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemCopyWith<$Res> {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) then) =
      _$MenuItemCopyWithImpl<$Res>;
  $Res call(
      {int index, String label, String flag, String tooltip, bool enabled});
}

/// @nodoc
class _$MenuItemCopyWithImpl<$Res> implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._value, this._then);

  final MenuItem _value;
  // ignore: unused_field
  final $Res Function(MenuItem) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$$_MenuItemCopyWith(
          _$_MenuItem value, $Res Function(_$_MenuItem) then) =
      __$$_MenuItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {int index, String label, String flag, String tooltip, bool enabled});
}

/// @nodoc
class __$$_MenuItemCopyWithImpl<$Res> extends _$MenuItemCopyWithImpl<$Res>
    implements _$$_MenuItemCopyWith<$Res> {
  __$$_MenuItemCopyWithImpl(
      _$_MenuItem _value, $Res Function(_$_MenuItem) _then)
      : super(_value, (v) => _then(v as _$_MenuItem));

  @override
  _$_MenuItem get _value => super._value as _$_MenuItem;

  @override
  $Res call({
    Object? index = freezed,
    Object? label = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
  }) {
    return _then(_$_MenuItem(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuItem with DiagnosticableTreeMixin implements _MenuItem {
  const _$_MenuItem(
      {this.index = 0,
      this.label = '',
      this.flag = '',
      this.tooltip = '',
      this.enabled = false});

  factory _$_MenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemFromJson(json);

  @override
  @JsonKey()
  final int index;
//  下标
  @override
  @JsonKey()
  final String label;
// 标题
  @override
  @JsonKey()
  final String flag;
// 标志
  @override
  @JsonKey()
  final String tooltip;
// 提示信息
  @override
  @JsonKey()
  final bool enabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuItem(index: $index, label: $label, flag: $flag, tooltip: $tooltip, enabled: $enabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MenuItem'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('flag', flag))
      ..add(DiagnosticsProperty('tooltip', tooltip))
      ..add(DiagnosticsProperty('enabled', enabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItem &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.tooltip, tooltip) &&
            const DeepCollectionEquality().equals(other.enabled, enabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(tooltip),
      const DeepCollectionEquality().hash(enabled));

  @JsonKey(ignore: true)
  @override
  _$$_MenuItemCopyWith<_$_MenuItem> get copyWith =>
      __$$_MenuItemCopyWithImpl<_$_MenuItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuItemToJson(this);
  }
}

abstract class _MenuItem implements MenuItem {
  const factory _MenuItem(
      {final int index,
      final String label,
      final String flag,
      final String tooltip,
      final bool enabled}) = _$_MenuItem;

  factory _MenuItem.fromJson(Map<String, dynamic> json) = _$_MenuItem.fromJson;

  @override
  int get index => throw _privateConstructorUsedError;
  @override //  下标
  String get label => throw _privateConstructorUsedError;
  @override // 标题
  String get flag => throw _privateConstructorUsedError;
  @override // 标志
  String get tooltip => throw _privateConstructorUsedError;
  @override // 提示信息
  bool get enabled => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemCopyWith<_$_MenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}
