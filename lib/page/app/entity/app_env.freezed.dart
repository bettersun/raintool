// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppEnv _$AppEnvFromJson(Map<String, dynamic> json) {
  return _AppEnv.fromJson(json);
}

/// @nodoc
mixin _$AppEnv {
  String get code => throw _privateConstructorUsedError; // 状态码
  String get message => throw _privateConstructorUsedError; // 消息
  String get title => throw _privateConstructorUsedError; // 应用标题
  String get theme => throw _privateConstructorUsedError; // 应用主题标志
  @JsonKey(ignore: true)
  ThemeData? get themeData => throw _privateConstructorUsedError; // 应用主题
  String get locale => throw _privateConstructorUsedError; // 应用语言标志
  String get label => throw _privateConstructorUsedError; // 主题切换标签
  String get apiHost => throw _privateConstructorUsedError; // API服务 URL
  String get rpcServer => throw _privateConstructorUsedError; // RPC服务 IP
  int get rpcPort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppEnvCopyWith<AppEnv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEnvCopyWith<$Res> {
  factory $AppEnvCopyWith(AppEnv value, $Res Function(AppEnv) then) =
      _$AppEnvCopyWithImpl<$Res, AppEnv>;
  @useResult
  $Res call(
      {String code,
      String message,
      String title,
      String theme,
      @JsonKey(ignore: true) ThemeData? themeData,
      String locale,
      String label,
      String apiHost,
      String rpcServer,
      int rpcPort});
}

/// @nodoc
class _$AppEnvCopyWithImpl<$Res, $Val extends AppEnv>
    implements $AppEnvCopyWith<$Res> {
  _$AppEnvCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? title = null,
    Object? theme = null,
    Object? themeData = freezed,
    Object? locale = null,
    Object? label = null,
    Object? apiHost = null,
    Object? rpcServer = null,
    Object? rpcPort = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      apiHost: null == apiHost
          ? _value.apiHost
          : apiHost // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServer: null == rpcServer
          ? _value.rpcServer
          : rpcServer // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPort: null == rpcPort
          ? _value.rpcPort
          : rpcPort // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppEnvCopyWith<$Res> implements $AppEnvCopyWith<$Res> {
  factory _$$_AppEnvCopyWith(_$_AppEnv value, $Res Function(_$_AppEnv) then) =
      __$$_AppEnvCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String message,
      String title,
      String theme,
      @JsonKey(ignore: true) ThemeData? themeData,
      String locale,
      String label,
      String apiHost,
      String rpcServer,
      int rpcPort});
}

/// @nodoc
class __$$_AppEnvCopyWithImpl<$Res>
    extends _$AppEnvCopyWithImpl<$Res, _$_AppEnv>
    implements _$$_AppEnvCopyWith<$Res> {
  __$$_AppEnvCopyWithImpl(_$_AppEnv _value, $Res Function(_$_AppEnv) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? title = null,
    Object? theme = null,
    Object? themeData = freezed,
    Object? locale = null,
    Object? label = null,
    Object? apiHost = null,
    Object? rpcServer = null,
    Object? rpcPort = null,
  }) {
    return _then(_$_AppEnv(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      apiHost: null == apiHost
          ? _value.apiHost
          : apiHost // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServer: null == rpcServer
          ? _value.rpcServer
          : rpcServer // ignore: cast_nullable_to_non_nullable
              as String,
      rpcPort: null == rpcPort
          ? _value.rpcPort
          : rpcPort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppEnv with DiagnosticableTreeMixin implements _AppEnv {
  const _$_AppEnv(
      {this.code = '',
      this.message = '',
      this.title = '',
      this.theme = '',
      @JsonKey(ignore: true) this.themeData = null,
      this.locale = '',
      this.label = '',
      this.apiHost = '',
      this.rpcServer = '',
      this.rpcPort = 0});

  factory _$_AppEnv.fromJson(Map<String, dynamic> json) =>
      _$$_AppEnvFromJson(json);

  @override
  @JsonKey()
  final String code;
// 状态码
  @override
  @JsonKey()
  final String message;
// 消息
  @override
  @JsonKey()
  final String title;
// 应用标题
  @override
  @JsonKey()
  final String theme;
// 应用主题标志
  @override
  @JsonKey(ignore: true)
  final ThemeData? themeData;
// 应用主题
  @override
  @JsonKey()
  final String locale;
// 应用语言标志
  @override
  @JsonKey()
  final String label;
// 主题切换标签
  @override
  @JsonKey()
  final String apiHost;
// API服务 URL
  @override
  @JsonKey()
  final String rpcServer;
// RPC服务 IP
  @override
  @JsonKey()
  final int rpcPort;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEnv(code: $code, message: $message, title: $title, theme: $theme, themeData: $themeData, locale: $locale, label: $label, apiHost: $apiHost, rpcServer: $rpcServer, rpcPort: $rpcPort)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEnv'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('theme', theme))
      ..add(DiagnosticsProperty('themeData', themeData))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('apiHost', apiHost))
      ..add(DiagnosticsProperty('rpcServer', rpcServer))
      ..add(DiagnosticsProperty('rpcPort', rpcPort));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppEnv &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.apiHost, apiHost) || other.apiHost == apiHost) &&
            (identical(other.rpcServer, rpcServer) ||
                other.rpcServer == rpcServer) &&
            (identical(other.rpcPort, rpcPort) || other.rpcPort == rpcPort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, title, theme,
      themeData, locale, label, apiHost, rpcServer, rpcPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppEnvCopyWith<_$_AppEnv> get copyWith =>
      __$$_AppEnvCopyWithImpl<_$_AppEnv>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppEnvToJson(
      this,
    );
  }
}

abstract class _AppEnv implements AppEnv {
  const factory _AppEnv(
      {final String code,
      final String message,
      final String title,
      final String theme,
      @JsonKey(ignore: true) final ThemeData? themeData,
      final String locale,
      final String label,
      final String apiHost,
      final String rpcServer,
      final int rpcPort}) = _$_AppEnv;

  factory _AppEnv.fromJson(Map<String, dynamic> json) = _$_AppEnv.fromJson;

  @override
  String get code;
  @override // 状态码
  String get message;
  @override // 消息
  String get title;
  @override // 应用标题
  String get theme;
  @override // 应用主题标志
  @JsonKey(ignore: true)
  ThemeData? get themeData;
  @override // 应用主题
  String get locale;
  @override // 应用语言标志
  String get label;
  @override // 主题切换标签
  String get apiHost;
  @override // API服务 URL
  String get rpcServer;
  @override // RPC服务 IP
  int get rpcPort;
  @override
  @JsonKey(ignore: true)
  _$$_AppEnvCopyWith<_$_AppEnv> get copyWith =>
      throw _privateConstructorUsedError;
}
