// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TabContent _$TabContentFromJson(Map<String, dynamic> json) {
  return _TabContent.fromJson(json);
}

/// @nodoc
mixin _$TabContent {
  List<TabContentItem> get tabContentItemList =>
      throw _privateConstructorUsedError; // 标签内容项目列表
  String get contentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabContentCopyWith<TabContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabContentCopyWith<$Res> {
  factory $TabContentCopyWith(
          TabContent value, $Res Function(TabContent) then) =
      _$TabContentCopyWithImpl<$Res>;
  $Res call({List<TabContentItem> tabContentItemList, String contentType});
}

/// @nodoc
class _$TabContentCopyWithImpl<$Res> implements $TabContentCopyWith<$Res> {
  _$TabContentCopyWithImpl(this._value, this._then);

  final TabContent _value;
  // ignore: unused_field
  final $Res Function(TabContent) _then;

  @override
  $Res call({
    Object? tabContentItemList = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_value.copyWith(
      tabContentItemList: tabContentItemList == freezed
          ? _value.tabContentItemList
          : tabContentItemList // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TabContentCopyWith<$Res>
    implements $TabContentCopyWith<$Res> {
  factory _$$_TabContentCopyWith(
          _$_TabContent value, $Res Function(_$_TabContent) then) =
      __$$_TabContentCopyWithImpl<$Res>;
  @override
  $Res call({List<TabContentItem> tabContentItemList, String contentType});
}

/// @nodoc
class __$$_TabContentCopyWithImpl<$Res> extends _$TabContentCopyWithImpl<$Res>
    implements _$$_TabContentCopyWith<$Res> {
  __$$_TabContentCopyWithImpl(
      _$_TabContent _value, $Res Function(_$_TabContent) _then)
      : super(_value, (v) => _then(v as _$_TabContent));

  @override
  _$_TabContent get _value => super._value as _$_TabContent;

  @override
  $Res call({
    Object? tabContentItemList = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_$_TabContent(
      tabContentItemList: tabContentItemList == freezed
          ? _value._tabContentItemList
          : tabContentItemList // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabContent implements _TabContent {
  const _$_TabContent(
      {final List<TabContentItem> tabContentItemList = const [],
      this.contentType = ''})
      : _tabContentItemList = tabContentItemList;

  factory _$_TabContent.fromJson(Map<String, dynamic> json) =>
      _$$_TabContentFromJson(json);

  final List<TabContentItem> _tabContentItemList;
  @override
  @JsonKey()
  List<TabContentItem> get tabContentItemList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabContentItemList);
  }

// 标签内容项目列表
  @override
  @JsonKey()
  final String contentType;

  @override
  String toString() {
    return 'TabContent(tabContentItemList: $tabContentItemList, contentType: $contentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabContent &&
            const DeepCollectionEquality()
                .equals(other._tabContentItemList, _tabContentItemList) &&
            const DeepCollectionEquality()
                .equals(other.contentType, contentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabContentItemList),
      const DeepCollectionEquality().hash(contentType));

  @JsonKey(ignore: true)
  @override
  _$$_TabContentCopyWith<_$_TabContent> get copyWith =>
      __$$_TabContentCopyWithImpl<_$_TabContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentToJson(this);
  }
}

abstract class _TabContent implements TabContent {
  const factory _TabContent(
      {final List<TabContentItem> tabContentItemList,
      final String contentType}) = _$_TabContent;

  factory _TabContent.fromJson(Map<String, dynamic> json) =
      _$_TabContent.fromJson;

  @override
  List<TabContentItem> get tabContentItemList =>
      throw _privateConstructorUsedError;
  @override // 标签内容项目列表
  String get contentType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TabContentCopyWith<_$_TabContent> get copyWith =>
      throw _privateConstructorUsedError;
}

TabContentItem _$TabContentItemFromJson(Map<String, dynamic> json) {
  return _TabContentItem.fromJson(json);
}

/// @nodoc
mixin _$TabContentItem {
  String get content => throw _privateConstructorUsedError; // 内容
  String get code => throw _privateConstructorUsedError; //  代码
  DateTime? get datetime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabContentItemCopyWith<TabContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabContentItemCopyWith<$Res> {
  factory $TabContentItemCopyWith(
          TabContentItem value, $Res Function(TabContentItem) then) =
      _$TabContentItemCopyWithImpl<$Res>;
  $Res call({String content, String code, DateTime? datetime});
}

/// @nodoc
class _$TabContentItemCopyWithImpl<$Res>
    implements $TabContentItemCopyWith<$Res> {
  _$TabContentItemCopyWithImpl(this._value, this._then);

  final TabContentItem _value;
  // ignore: unused_field
  final $Res Function(TabContentItem) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? code = freezed,
    Object? datetime = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TabContentItemCopyWith<$Res>
    implements $TabContentItemCopyWith<$Res> {
  factory _$$_TabContentItemCopyWith(
          _$_TabContentItem value, $Res Function(_$_TabContentItem) then) =
      __$$_TabContentItemCopyWithImpl<$Res>;
  @override
  $Res call({String content, String code, DateTime? datetime});
}

/// @nodoc
class __$$_TabContentItemCopyWithImpl<$Res>
    extends _$TabContentItemCopyWithImpl<$Res>
    implements _$$_TabContentItemCopyWith<$Res> {
  __$$_TabContentItemCopyWithImpl(
      _$_TabContentItem _value, $Res Function(_$_TabContentItem) _then)
      : super(_value, (v) => _then(v as _$_TabContentItem));

  @override
  _$_TabContentItem get _value => super._value as _$_TabContentItem;

  @override
  $Res call({
    Object? content = freezed,
    Object? code = freezed,
    Object? datetime = freezed,
  }) {
    return _then(_$_TabContentItem(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabContentItem implements _TabContentItem {
  const _$_TabContentItem(
      {this.content = '', this.code = '', this.datetime = null});

  factory _$_TabContentItem.fromJson(Map<String, dynamic> json) =>
      _$$_TabContentItemFromJson(json);

  @override
  @JsonKey()
  final String content;
// 内容
  @override
  @JsonKey()
  final String code;
//  代码
  @override
  @JsonKey()
  final DateTime? datetime;

  @override
  String toString() {
    return 'TabContentItem(content: $content, code: $code, datetime: $datetime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabContentItem &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.datetime, datetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(datetime));

  @JsonKey(ignore: true)
  @override
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      __$$_TabContentItemCopyWithImpl<_$_TabContentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentItemToJson(this);
  }
}

abstract class _TabContentItem implements TabContentItem {
  const factory _TabContentItem(
      {final String content,
      final String code,
      final DateTime? datetime}) = _$_TabContentItem;

  factory _TabContentItem.fromJson(Map<String, dynamic> json) =
      _$_TabContentItem.fromJson;

  @override
  String get content => throw _privateConstructorUsedError;
  @override // 内容
  String get code => throw _privateConstructorUsedError;
  @override //  代码
  DateTime? get datetime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}
