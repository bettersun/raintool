// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TabInfo _$TabInfoFromJson(Map<String, dynamic> json) {
  return _TabInfo.fromJson(json);
}

/// @nodoc
mixin _$TabInfo {
  String get code => throw _privateConstructorUsedError; // 状态码
  String get message => throw _privateConstructorUsedError; // 消息
  List<TabItem> get tabList => throw _privateConstructorUsedError; // 可用的标签列表
  List<TabItem> get enabledTabList =>
      throw _privateConstructorUsedError; // 可用的标签列表
  List<TabItem> get disabledTabList =>
      throw _privateConstructorUsedError; // 不可用的标签列表
  int get selectedTabIndex => throw _privateConstructorUsedError; // 选中的标签下标
  bool get editMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabInfoCopyWith<TabInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabInfoCopyWith<$Res> {
  factory $TabInfoCopyWith(TabInfo value, $Res Function(TabInfo) then) =
      _$TabInfoCopyWithImpl<$Res>;
  $Res call(
      {String code,
      String message,
      List<TabItem> tabList,
      List<TabItem> enabledTabList,
      List<TabItem> disabledTabList,
      int selectedTabIndex,
      bool editMode});
}

/// @nodoc
class _$TabInfoCopyWithImpl<$Res> implements $TabInfoCopyWith<$Res> {
  _$TabInfoCopyWithImpl(this._value, this._then);

  final TabInfo _value;
  // ignore: unused_field
  final $Res Function(TabInfo) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? tabList = freezed,
    Object? enabledTabList = freezed,
    Object? disabledTabList = freezed,
    Object? selectedTabIndex = freezed,
    Object? editMode = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tabList: tabList == freezed
          ? _value.tabList
          : tabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      enabledTabList: enabledTabList == freezed
          ? _value.enabledTabList
          : enabledTabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      disabledTabList: disabledTabList == freezed
          ? _value.disabledTabList
          : disabledTabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      editMode: editMode == freezed
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TabInfoCopyWith<$Res> implements $TabInfoCopyWith<$Res> {
  factory _$$_TabInfoCopyWith(
          _$_TabInfo value, $Res Function(_$_TabInfo) then) =
      __$$_TabInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      String message,
      List<TabItem> tabList,
      List<TabItem> enabledTabList,
      List<TabItem> disabledTabList,
      int selectedTabIndex,
      bool editMode});
}

/// @nodoc
class __$$_TabInfoCopyWithImpl<$Res> extends _$TabInfoCopyWithImpl<$Res>
    implements _$$_TabInfoCopyWith<$Res> {
  __$$_TabInfoCopyWithImpl(_$_TabInfo _value, $Res Function(_$_TabInfo) _then)
      : super(_value, (v) => _then(v as _$_TabInfo));

  @override
  _$_TabInfo get _value => super._value as _$_TabInfo;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? tabList = freezed,
    Object? enabledTabList = freezed,
    Object? disabledTabList = freezed,
    Object? selectedTabIndex = freezed,
    Object? editMode = freezed,
  }) {
    return _then(_$_TabInfo(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tabList: tabList == freezed
          ? _value._tabList
          : tabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      enabledTabList: enabledTabList == freezed
          ? _value._enabledTabList
          : enabledTabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      disabledTabList: disabledTabList == freezed
          ? _value._disabledTabList
          : disabledTabList // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      selectedTabIndex: selectedTabIndex == freezed
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      editMode: editMode == freezed
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabInfo implements _TabInfo {
  const _$_TabInfo(
      {this.code = '',
      this.message = '',
      final List<TabItem> tabList = const [],
      final List<TabItem> enabledTabList = const [],
      final List<TabItem> disabledTabList = const [],
      this.selectedTabIndex = 0,
      this.editMode = false})
      : _tabList = tabList,
        _enabledTabList = enabledTabList,
        _disabledTabList = disabledTabList;

  factory _$_TabInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TabInfoFromJson(json);

  @override
  @JsonKey()
  final String code;
// 状态码
  @override
  @JsonKey()
  final String message;
// 消息
  final List<TabItem> _tabList;
// 消息
  @override
  @JsonKey()
  List<TabItem> get tabList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabList);
  }

// 可用的标签列表
  final List<TabItem> _enabledTabList;
// 可用的标签列表
  @override
  @JsonKey()
  List<TabItem> get enabledTabList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledTabList);
  }

// 可用的标签列表
  final List<TabItem> _disabledTabList;
// 可用的标签列表
  @override
  @JsonKey()
  List<TabItem> get disabledTabList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabledTabList);
  }

// 不可用的标签列表
  @override
  @JsonKey()
  final int selectedTabIndex;
// 选中的标签下标
  @override
  @JsonKey()
  final bool editMode;

  @override
  String toString() {
    return 'TabInfo(code: $code, message: $message, tabList: $tabList, enabledTabList: $enabledTabList, disabledTabList: $disabledTabList, selectedTabIndex: $selectedTabIndex, editMode: $editMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabInfo &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other._tabList, _tabList) &&
            const DeepCollectionEquality()
                .equals(other._enabledTabList, _enabledTabList) &&
            const DeepCollectionEquality()
                .equals(other._disabledTabList, _disabledTabList) &&
            const DeepCollectionEquality()
                .equals(other.selectedTabIndex, selectedTabIndex) &&
            const DeepCollectionEquality().equals(other.editMode, editMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_tabList),
      const DeepCollectionEquality().hash(_enabledTabList),
      const DeepCollectionEquality().hash(_disabledTabList),
      const DeepCollectionEquality().hash(selectedTabIndex),
      const DeepCollectionEquality().hash(editMode));

  @JsonKey(ignore: true)
  @override
  _$$_TabInfoCopyWith<_$_TabInfo> get copyWith =>
      __$$_TabInfoCopyWithImpl<_$_TabInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabInfoToJson(this);
  }
}

abstract class _TabInfo implements TabInfo {
  const factory _TabInfo(
      {final String code,
      final String message,
      final List<TabItem> tabList,
      final List<TabItem> enabledTabList,
      final List<TabItem> disabledTabList,
      final int selectedTabIndex,
      final bool editMode}) = _$_TabInfo;

  factory _TabInfo.fromJson(Map<String, dynamic> json) = _$_TabInfo.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override // 状态码
  String get message => throw _privateConstructorUsedError;
  @override // 消息
  List<TabItem> get tabList => throw _privateConstructorUsedError;
  @override // 可用的标签列表
  List<TabItem> get enabledTabList => throw _privateConstructorUsedError;
  @override // 可用的标签列表
  List<TabItem> get disabledTabList => throw _privateConstructorUsedError;
  @override // 不可用的标签列表
  int get selectedTabIndex => throw _privateConstructorUsedError;
  @override // 选中的标签下标
  bool get editMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TabInfoCopyWith<_$_TabInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

TabItem _$TabItemFromJson(Map<String, dynamic> json) {
  return _TabItem.fromJson(json);
}

/// @nodoc
mixin _$TabItem {
  String get flag => throw _privateConstructorUsedError; //  标签标志
  String get tooltip => throw _privateConstructorUsedError; // 标签提示信息
  bool get enable => throw _privateConstructorUsedError; // 可用
  @JsonKey(ignore: true)
  IconData? get iconData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabItemCopyWith<TabItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabItemCopyWith<$Res> {
  factory $TabItemCopyWith(TabItem value, $Res Function(TabItem) then) =
      _$TabItemCopyWithImpl<$Res>;
  $Res call(
      {String flag,
      String tooltip,
      bool enable,
      @JsonKey(ignore: true) IconData? iconData});
}

/// @nodoc
class _$TabItemCopyWithImpl<$Res> implements $TabItemCopyWith<$Res> {
  _$TabItemCopyWithImpl(this._value, this._then);

  final TabItem _value;
  // ignore: unused_field
  final $Res Function(TabItem) _then;

  @override
  $Res call({
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enable = freezed,
    Object? iconData = freezed,
  }) {
    return _then(_value.copyWith(
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ));
  }
}

/// @nodoc
abstract class _$$_TabItemCopyWith<$Res> implements $TabItemCopyWith<$Res> {
  factory _$$_TabItemCopyWith(
          _$_TabItem value, $Res Function(_$_TabItem) then) =
      __$$_TabItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String flag,
      String tooltip,
      bool enable,
      @JsonKey(ignore: true) IconData? iconData});
}

/// @nodoc
class __$$_TabItemCopyWithImpl<$Res> extends _$TabItemCopyWithImpl<$Res>
    implements _$$_TabItemCopyWith<$Res> {
  __$$_TabItemCopyWithImpl(_$_TabItem _value, $Res Function(_$_TabItem) _then)
      : super(_value, (v) => _then(v as _$_TabItem));

  @override
  _$_TabItem get _value => super._value as _$_TabItem;

  @override
  $Res call({
    Object? flag = freezed,
    Object? tooltip = freezed,
    Object? enable = freezed,
    Object? iconData = freezed,
  }) {
    return _then(_$_TabItem(
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: tooltip == freezed
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String,
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabItem implements _TabItem {
  const _$_TabItem(
      {this.flag = '',
      this.tooltip = '',
      this.enable = false,
      @JsonKey(ignore: true) this.iconData = null});

  factory _$_TabItem.fromJson(Map<String, dynamic> json) =>
      _$$_TabItemFromJson(json);

  @override
  @JsonKey()
  final String flag;
//  标签标志
  @override
  @JsonKey()
  final String tooltip;
// 标签提示信息
  @override
  @JsonKey()
  final bool enable;
// 可用
  @override
  @JsonKey(ignore: true)
  final IconData? iconData;

  @override
  String toString() {
    return 'TabItem(flag: $flag, tooltip: $tooltip, enable: $enable, iconData: $iconData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabItem &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.tooltip, tooltip) &&
            const DeepCollectionEquality().equals(other.enable, enable) &&
            const DeepCollectionEquality().equals(other.iconData, iconData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(tooltip),
      const DeepCollectionEquality().hash(enable),
      const DeepCollectionEquality().hash(iconData));

  @JsonKey(ignore: true)
  @override
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      __$$_TabItemCopyWithImpl<_$_TabItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabItemToJson(this);
  }
}

abstract class _TabItem implements TabItem {
  const factory _TabItem(
      {final String flag,
      final String tooltip,
      final bool enable,
      @JsonKey(ignore: true) final IconData? iconData}) = _$_TabItem;

  factory _TabItem.fromJson(Map<String, dynamic> json) = _$_TabItem.fromJson;

  @override
  String get flag => throw _privateConstructorUsedError;
  @override //  标签标志
  String get tooltip => throw _privateConstructorUsedError;
  @override // 标签提示信息
  bool get enable => throw _privateConstructorUsedError;
  @override // 可用
  @JsonKey(ignore: true)
  IconData? get iconData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TabItemCopyWith<_$_TabItem> get copyWith =>
      throw _privateConstructorUsedError;
}
