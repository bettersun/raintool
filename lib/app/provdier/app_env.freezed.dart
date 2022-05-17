// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get locale => throw _privateConstructorUsedError; // 应用语言标志
  String get label => throw _privateConstructorUsedError; // 主题切换标签
  String get apiServer => throw _privateConstructorUsedError; // API服务 URL
  String get rpcServerIp => throw _privateConstructorUsedError; // RPC服务 IP
  int get rpcServerPort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppEnvCopyWith<AppEnv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEnvCopyWith<$Res> {
  factory $AppEnvCopyWith(AppEnv value, $Res Function(AppEnv) then) =
      _$AppEnvCopyWithImpl<$Res>;
  $Res call(
      {String code,
      String message,
      String title,
      String theme,
      String locale,
      String label,
      String apiServer,
      String rpcServerIp,
      int rpcServerPort});
}

/// @nodoc
class _$AppEnvCopyWithImpl<$Res> implements $AppEnvCopyWith<$Res> {
  _$AppEnvCopyWithImpl(this._value, this._then);

  final AppEnv _value;
  // ignore: unused_field
  final $Res Function(AppEnv) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? title = freezed,
    Object? theme = freezed,
    Object? locale = freezed,
    Object? label = freezed,
    Object? apiServer = freezed,
    Object? rpcServerIp = freezed,
    Object? rpcServerPort = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      apiServer: apiServer == freezed
          ? _value.apiServer
          : apiServer // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServerIp: rpcServerIp == freezed
          ? _value.rpcServerIp
          : rpcServerIp // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServerPort: rpcServerPort == freezed
          ? _value.rpcServerPort
          : rpcServerPort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_AppEnvCopyWith<$Res> implements $AppEnvCopyWith<$Res> {
  factory _$$_AppEnvCopyWith(_$_AppEnv value, $Res Function(_$_AppEnv) then) =
      __$$_AppEnvCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      String message,
      String title,
      String theme,
      String locale,
      String label,
      String apiServer,
      String rpcServerIp,
      int rpcServerPort});
}

/// @nodoc
class __$$_AppEnvCopyWithImpl<$Res> extends _$AppEnvCopyWithImpl<$Res>
    implements _$$_AppEnvCopyWith<$Res> {
  __$$_AppEnvCopyWithImpl(_$_AppEnv _value, $Res Function(_$_AppEnv) _then)
      : super(_value, (v) => _then(v as _$_AppEnv));

  @override
  _$_AppEnv get _value => super._value as _$_AppEnv;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? title = freezed,
    Object? theme = freezed,
    Object? locale = freezed,
    Object? label = freezed,
    Object? apiServer = freezed,
    Object? rpcServerIp = freezed,
    Object? rpcServerPort = freezed,
  }) {
    return _then(_$_AppEnv(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      apiServer: apiServer == freezed
          ? _value.apiServer
          : apiServer // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServerIp: rpcServerIp == freezed
          ? _value.rpcServerIp
          : rpcServerIp // ignore: cast_nullable_to_non_nullable
              as String,
      rpcServerPort: rpcServerPort == freezed
          ? _value.rpcServerPort
          : rpcServerPort // ignore: cast_nullable_to_non_nullable
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
      this.locale = '',
      this.label = '',
      this.apiServer = '',
      this.rpcServerIp = '',
      this.rpcServerPort = 0});

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
  @JsonKey()
  final String locale;
// 应用语言标志
  @override
  @JsonKey()
  final String label;
// 主题切换标签
  @override
  @JsonKey()
  final String apiServer;
// API服务 URL
  @override
  @JsonKey()
  final String rpcServerIp;
// RPC服务 IP
  @override
  @JsonKey()
  final int rpcServerPort;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEnv(code: $code, message: $message, title: $title, theme: $theme, locale: $locale, label: $label, apiServer: $apiServer, rpcServerIp: $rpcServerIp, rpcServerPort: $rpcServerPort)';
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
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('apiServer', apiServer))
      ..add(DiagnosticsProperty('rpcServerIp', rpcServerIp))
      ..add(DiagnosticsProperty('rpcServerPort', rpcServerPort));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppEnv &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.apiServer, apiServer) &&
            const DeepCollectionEquality()
                .equals(other.rpcServerIp, rpcServerIp) &&
            const DeepCollectionEquality()
                .equals(other.rpcServerPort, rpcServerPort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(theme),
      const DeepCollectionEquality().hash(locale),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(apiServer),
      const DeepCollectionEquality().hash(rpcServerIp),
      const DeepCollectionEquality().hash(rpcServerPort));

  @JsonKey(ignore: true)
  @override
  _$$_AppEnvCopyWith<_$_AppEnv> get copyWith =>
      __$$_AppEnvCopyWithImpl<_$_AppEnv>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppEnvToJson(this);
  }
}

abstract class _AppEnv implements AppEnv {
  const factory _AppEnv(
      {final String code,
      final String message,
      final String title,
      final String theme,
      final String locale,
      final String label,
      final String apiServer,
      final String rpcServerIp,
      final int rpcServerPort}) = _$_AppEnv;

  factory _AppEnv.fromJson(Map<String, dynamic> json) = _$_AppEnv.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override // 状态码
  String get message => throw _privateConstructorUsedError;
  @override // 消息
  String get title => throw _privateConstructorUsedError;
  @override // 应用标题
  String get theme => throw _privateConstructorUsedError;
  @override // 应用主题标志
  String get locale => throw _privateConstructorUsedError;
  @override // 应用语言标志
  String get label => throw _privateConstructorUsedError;
  @override // 主题切换标签
  String get apiServer => throw _privateConstructorUsedError;
  @override // API服务 URL
  String get rpcServerIp => throw _privateConstructorUsedError;
  @override // RPC服务 IP
  int get rpcServerPort => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppEnvCopyWith<_$_AppEnv> get copyWith =>
      throw _privateConstructorUsedError;
}
