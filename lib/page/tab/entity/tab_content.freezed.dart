// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$TabContentCopyWithImpl<$Res, TabContent>;
  @useResult
  $Res call({List<TabContentItem> tabContentItemList, String contentType});
}

/// @nodoc
class _$TabContentCopyWithImpl<$Res, $Val extends TabContent>
    implements $TabContentCopyWith<$Res> {
  _$TabContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabContentItemList = null,
    Object? contentType = null,
  }) {
    return _then(_value.copyWith(
      tabContentItemList: null == tabContentItemList
          ? _value.tabContentItemList
          : tabContentItemList // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabContentCopyWith<$Res>
    implements $TabContentCopyWith<$Res> {
  factory _$$_TabContentCopyWith(
          _$_TabContent value, $Res Function(_$_TabContent) then) =
      __$$_TabContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TabContentItem> tabContentItemList, String contentType});
}

/// @nodoc
class __$$_TabContentCopyWithImpl<$Res>
    extends _$TabContentCopyWithImpl<$Res, _$_TabContent>
    implements _$$_TabContentCopyWith<$Res> {
  __$$_TabContentCopyWithImpl(
      _$_TabContent _value, $Res Function(_$_TabContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabContentItemList = null,
    Object? contentType = null,
  }) {
    return _then(_$_TabContent(
      tabContentItemList: null == tabContentItemList
          ? _value._tabContentItemList
          : tabContentItemList // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
      contentType: null == contentType
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
    if (_tabContentItemList is EqualUnmodifiableListView)
      return _tabContentItemList;
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
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tabContentItemList), contentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabContentCopyWith<_$_TabContent> get copyWith =>
      __$$_TabContentCopyWithImpl<_$_TabContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentToJson(
      this,
    );
  }
}

abstract class _TabContent implements TabContent {
  const factory _TabContent(
      {final List<TabContentItem> tabContentItemList,
      final String contentType}) = _$_TabContent;

  factory _TabContent.fromJson(Map<String, dynamic> json) =
      _$_TabContent.fromJson;

  @override
  List<TabContentItem> get tabContentItemList;
  @override // 标签内容项目列表
  String get contentType;
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
      _$TabContentItemCopyWithImpl<$Res, TabContentItem>;
  @useResult
  $Res call({String content, String code, DateTime? datetime});
}

/// @nodoc
class _$TabContentItemCopyWithImpl<$Res, $Val extends TabContentItem>
    implements $TabContentItemCopyWith<$Res> {
  _$TabContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? code = null,
    Object? datetime = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabContentItemCopyWith<$Res>
    implements $TabContentItemCopyWith<$Res> {
  factory _$$_TabContentItemCopyWith(
          _$_TabContentItem value, $Res Function(_$_TabContentItem) then) =
      __$$_TabContentItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String code, DateTime? datetime});
}

/// @nodoc
class __$$_TabContentItemCopyWithImpl<$Res>
    extends _$TabContentItemCopyWithImpl<$Res, _$_TabContentItem>
    implements _$$_TabContentItemCopyWith<$Res> {
  __$$_TabContentItemCopyWithImpl(
      _$_TabContentItem _value, $Res Function(_$_TabContentItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? code = null,
    Object? datetime = freezed,
  }) {
    return _then(_$_TabContentItem(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: freezed == datetime
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
            (identical(other.content, content) || other.content == content) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, code, datetime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      __$$_TabContentItemCopyWithImpl<_$_TabContentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentItemToJson(
      this,
    );
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
  String get content;
  @override // 内容
  String get code;
  @override //  代码
  DateTime? get datetime;
  @override
  @JsonKey(ignore: true)
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}
