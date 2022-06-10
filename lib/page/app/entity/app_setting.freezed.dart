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
  List<BMenuItem> get naviItemList =>
      throw _privateConstructorUsedError; // 底边栏项目列表
  List<BMenuItem> get menuItemList =>
      throw _privateConstructorUsedError; // 菜单项目列表
  int get selectedNaviIndex => throw _privateConstructorUsedError; // 当前的底边栏下标
  int get selectedMenuIndex => throw _privateConstructorUsedError; // 当前的菜单栏下标
  bool get showNavibar => throw _privateConstructorUsedError;

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
  $Res call(
      {List<BMenuItem> naviItemList,
      List<BMenuItem> menuItemList,
      int selectedNaviIndex,
      int selectedMenuIndex,
      bool showNavibar});
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
    Object? selectedNaviIndex = freezed,
    Object? selectedMenuIndex = freezed,
    Object? showNavibar = freezed,
  }) {
    return _then(_value.copyWith(
      naviItemList: naviItemList == freezed
          ? _value.naviItemList
          : naviItemList // ignore: cast_nullable_to_non_nullable
              as List<BMenuItem>,
      menuItemList: menuItemList == freezed
          ? _value.menuItemList
          : menuItemList // ignore: cast_nullable_to_non_nullable
              as List<BMenuItem>,
      selectedNaviIndex: selectedNaviIndex == freezed
          ? _value.selectedNaviIndex
          : selectedNaviIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMenuIndex: selectedMenuIndex == freezed
          ? _value.selectedMenuIndex
          : selectedMenuIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showNavibar: showNavibar == freezed
          ? _value.showNavibar
          : showNavibar // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {List<BMenuItem> naviItemList,
      List<BMenuItem> menuItemList,
      int selectedNaviIndex,
      int selectedMenuIndex,
      bool showNavibar});
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
    Object? selectedNaviIndex = freezed,
    Object? selectedMenuIndex = freezed,
    Object? showNavibar = freezed,
  }) {
    return _then(_$_AppSetting(
      naviItemList: naviItemList == freezed
          ? _value._naviItemList
          : naviItemList // ignore: cast_nullable_to_non_nullable
              as List<BMenuItem>,
      menuItemList: menuItemList == freezed
          ? _value._menuItemList
          : menuItemList // ignore: cast_nullable_to_non_nullable
              as List<BMenuItem>,
      selectedNaviIndex: selectedNaviIndex == freezed
          ? _value.selectedNaviIndex
          : selectedNaviIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMenuIndex: selectedMenuIndex == freezed
          ? _value.selectedMenuIndex
          : selectedMenuIndex // ignore: cast_nullable_to_non_nullable
              as int,
      showNavibar: showNavibar == freezed
          ? _value.showNavibar
          : showNavibar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppSetting with DiagnosticableTreeMixin implements _AppSetting {
  const _$_AppSetting(
      {final List<BMenuItem> naviItemList = const [],
      final List<BMenuItem> menuItemList = const [],
      this.selectedNaviIndex = 0,
      this.selectedMenuIndex = 0,
      this.showNavibar = true})
      : _naviItemList = naviItemList,
        _menuItemList = menuItemList;

  factory _$_AppSetting.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingFromJson(json);

  final List<BMenuItem> _naviItemList;
  @override
  @JsonKey()
  List<BMenuItem> get naviItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_naviItemList);
  }

// 底边栏项目列表
  final List<BMenuItem> _menuItemList;
// 底边栏项目列表
  @override
  @JsonKey()
  List<BMenuItem> get menuItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItemList);
  }

// 菜单项目列表
  @override
  @JsonKey()
  final int selectedNaviIndex;
// 当前的底边栏下标
  @override
  @JsonKey()
  final int selectedMenuIndex;
// 当前的菜单栏下标
  @override
  @JsonKey()
  final bool showNavibar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppSetting(naviItemList: $naviItemList, menuItemList: $menuItemList, selectedNaviIndex: $selectedNaviIndex, selectedMenuIndex: $selectedMenuIndex, showNavibar: $showNavibar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppSetting'))
      ..add(DiagnosticsProperty('naviItemList', naviItemList))
      ..add(DiagnosticsProperty('menuItemList', menuItemList))
      ..add(DiagnosticsProperty('selectedNaviIndex', selectedNaviIndex))
      ..add(DiagnosticsProperty('selectedMenuIndex', selectedMenuIndex))
      ..add(DiagnosticsProperty('showNavibar', showNavibar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSetting &&
            const DeepCollectionEquality()
                .equals(other._naviItemList, _naviItemList) &&
            const DeepCollectionEquality()
                .equals(other._menuItemList, _menuItemList) &&
            const DeepCollectionEquality()
                .equals(other.selectedNaviIndex, selectedNaviIndex) &&
            const DeepCollectionEquality()
                .equals(other.selectedMenuIndex, selectedMenuIndex) &&
            const DeepCollectionEquality()
                .equals(other.showNavibar, showNavibar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_naviItemList),
      const DeepCollectionEquality().hash(_menuItemList),
      const DeepCollectionEquality().hash(selectedNaviIndex),
      const DeepCollectionEquality().hash(selectedMenuIndex),
      const DeepCollectionEquality().hash(showNavibar));

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
      {final List<BMenuItem> naviItemList,
      final List<BMenuItem> menuItemList,
      final int selectedNaviIndex,
      final int selectedMenuIndex,
      final bool showNavibar}) = _$_AppSetting;

  factory _AppSetting.fromJson(Map<String, dynamic> json) =
      _$_AppSetting.fromJson;

  @override
  List<BMenuItem> get naviItemList => throw _privateConstructorUsedError;
  @override // 底边栏项目列表
  List<BMenuItem> get menuItemList => throw _privateConstructorUsedError;
  @override // 菜单项目列表
  int get selectedNaviIndex => throw _privateConstructorUsedError;
  @override // 当前的底边栏下标
  int get selectedMenuIndex => throw _privateConstructorUsedError;
  @override // 当前的菜单栏下标
  bool get showNavibar => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingCopyWith<_$_AppSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

BMenuItem _$BMenuItemFromJson(Map<String, dynamic> json) {
  return _BMenuItem.fromJson(json);
}

/// @nodoc
mixin _$BMenuItem {
  @JsonKey(ignore: true)
  int get index => throw _privateConstructorUsedError; // 下标
  int get orderNum => throw _privateConstructorUsedError; // 顺序
  String get label => throw _privateConstructorUsedError; // 标题
  @JsonKey(ignore: true)
  IconData? get icon => throw _privateConstructorUsedError; // 图标
  String get flag => throw _privateConstructorUsedError; // 标志
  String get tooltip => throw _privateConstructorUsedError; // 提示信息
  bool get enabled => throw _privateConstructorUsedError; // 可用
  bool get naviItem => throw _privateConstructorUsedError; // 底边栏项目标志
  int get naviOrder => throw _privateConstructorUsedError; // 底边栏顺序
  @JsonKey(ignore: true)
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BMenuItemCopyWith<BMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BMenuItemCopyWith<$Res> {
  factory $BMenuItemCopyWith(BMenuItem value, $Res Function(BMenuItem) then) =
      _$BMenuItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) int index,
      int orderNum,
      String label,
      @JsonKey(ignore: true) IconData? icon,
      String flag,
      String tooltip,
      bool enabled,
      bool naviItem,
      int naviOrder,
      @JsonKey(ignore: true) String path});
}

/// @nodoc
class _$BMenuItemCopyWithImpl<$Res> implements $BMenuItemCopyWith<$Res> {
  _$BMenuItemCopyWithImpl(this._value, this._then);

  final BMenuItem _value;
  // ignore: unused_field
  final $Res Function(BMenuItem) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? orderNum = freezed,
    Object? label = freezed,
    Object? icon = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
    Object? naviItem = freezed,
    Object? naviOrder = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      orderNum: orderNum == freezed
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
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
      naviItem: naviItem == freezed
          ? _value.naviItem
          : naviItem // ignore: cast_nullable_to_non_nullable
              as bool,
      naviOrder: naviOrder == freezed
          ? _value.naviOrder
          : naviOrder // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BMenuItemCopyWith<$Res> implements $BMenuItemCopyWith<$Res> {
  factory _$$_BMenuItemCopyWith(
          _$_BMenuItem value, $Res Function(_$_BMenuItem) then) =
      __$$_BMenuItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) int index,
      int orderNum,
      String label,
      @JsonKey(ignore: true) IconData? icon,
      String flag,
      String tooltip,
      bool enabled,
      bool naviItem,
      int naviOrder,
      @JsonKey(ignore: true) String path});
}

/// @nodoc
class __$$_BMenuItemCopyWithImpl<$Res> extends _$BMenuItemCopyWithImpl<$Res>
    implements _$$_BMenuItemCopyWith<$Res> {
  __$$_BMenuItemCopyWithImpl(
      _$_BMenuItem _value, $Res Function(_$_BMenuItem) _then)
      : super(_value, (v) => _then(v as _$_BMenuItem));

  @override
  _$_BMenuItem get _value => super._value as _$_BMenuItem;

  @override
  $Res call({
    Object? index = freezed,
    Object? orderNum = freezed,
    Object? label = freezed,
    Object? icon = freezed,
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enabled = freezed,
    Object? naviItem = freezed,
    Object? naviOrder = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_BMenuItem(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      orderNum: orderNum == freezed
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
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
      naviItem: naviItem == freezed
          ? _value.naviItem
          : naviItem // ignore: cast_nullable_to_non_nullable
              as bool,
      naviOrder: naviOrder == freezed
          ? _value.naviOrder
          : naviOrder // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BMenuItem with DiagnosticableTreeMixin implements _BMenuItem {
  const _$_BMenuItem(
      {@JsonKey(ignore: true) this.index = 0,
      this.orderNum = 0,
      this.label = '',
      @JsonKey(ignore: true) this.icon,
      this.flag = '',
      this.tooltip = '',
      this.enabled = false,
      this.naviItem = false,
      this.naviOrder = 0,
      @JsonKey(ignore: true) this.path = ''});

  factory _$_BMenuItem.fromJson(Map<String, dynamic> json) =>
      _$$_BMenuItemFromJson(json);

  @override
  @JsonKey(ignore: true)
  final int index;
// 下标
  @override
  @JsonKey()
  final int orderNum;
// 顺序
  @override
  @JsonKey()
  final String label;
// 标题
  @override
  @JsonKey(ignore: true)
  final IconData? icon;
// 图标
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
// 可用
  @override
  @JsonKey()
  final bool naviItem;
// 底边栏项目标志
  @override
  @JsonKey()
  final int naviOrder;
// 底边栏顺序
  @override
  @JsonKey(ignore: true)
  final String path;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BMenuItem(index: $index, orderNum: $orderNum, label: $label, icon: $icon, flag: $flag, tooltip: $tooltip, enabled: $enabled, naviItem: $naviItem, naviOrder: $naviOrder, path: $path)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BMenuItem'))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('orderNum', orderNum))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('flag', flag))
      ..add(DiagnosticsProperty('tooltip', tooltip))
      ..add(DiagnosticsProperty('enabled', enabled))
      ..add(DiagnosticsProperty('naviItem', naviItem))
      ..add(DiagnosticsProperty('naviOrder', naviOrder))
      ..add(DiagnosticsProperty('path', path));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BMenuItem &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.orderNum, orderNum) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.tooltip, tooltip) &&
            const DeepCollectionEquality().equals(other.enabled, enabled) &&
            const DeepCollectionEquality().equals(other.naviItem, naviItem) &&
            const DeepCollectionEquality().equals(other.naviOrder, naviOrder) &&
            const DeepCollectionEquality().equals(other.path, path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(orderNum),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(tooltip),
      const DeepCollectionEquality().hash(enabled),
      const DeepCollectionEquality().hash(naviItem),
      const DeepCollectionEquality().hash(naviOrder),
      const DeepCollectionEquality().hash(path));

  @JsonKey(ignore: true)
  @override
  _$$_BMenuItemCopyWith<_$_BMenuItem> get copyWith =>
      __$$_BMenuItemCopyWithImpl<_$_BMenuItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BMenuItemToJson(this);
  }
}

abstract class _BMenuItem implements BMenuItem {
  const factory _BMenuItem(
      {@JsonKey(ignore: true) final int index,
      final int orderNum,
      final String label,
      @JsonKey(ignore: true) final IconData? icon,
      final String flag,
      final String tooltip,
      final bool enabled,
      final bool naviItem,
      final int naviOrder,
      @JsonKey(ignore: true) final String path}) = _$_BMenuItem;

  factory _BMenuItem.fromJson(Map<String, dynamic> json) =
      _$_BMenuItem.fromJson;

  @override
  @JsonKey(ignore: true)
  int get index => throw _privateConstructorUsedError;
  @override // 下标
  int get orderNum => throw _privateConstructorUsedError;
  @override // 顺序
  String get label => throw _privateConstructorUsedError;
  @override // 标题
  @JsonKey(ignore: true)
  IconData? get icon => throw _privateConstructorUsedError;
  @override // 图标
  String get flag => throw _privateConstructorUsedError;
  @override // 标志
  String get tooltip => throw _privateConstructorUsedError;
  @override // 提示信息
  bool get enabled => throw _privateConstructorUsedError;
  @override // 可用
  bool get naviItem => throw _privateConstructorUsedError;
  @override // 底边栏项目标志
  int get naviOrder => throw _privateConstructorUsedError;
  @override // 底边栏顺序
  @JsonKey(ignore: true)
  String get path => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BMenuItemCopyWith<_$_BMenuItem> get copyWith =>
      throw _privateConstructorUsedError;
}
