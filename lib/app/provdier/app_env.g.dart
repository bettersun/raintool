// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppEnv _$$_AppEnvFromJson(Map<String, dynamic> json) => _$_AppEnv(
      code: json['code'] as String? ?? '',
      message: json['message'] as String? ?? '',
      title: json['title'] as String? ?? '',
      theme: json['theme'] as String? ?? '',
      locale: json['locale'] as String? ?? '',
      label: json['label'] as String? ?? '',
      apiServer: json['apiServer'] as String? ?? '',
      rpcServerIp: json['rpcServerIp'] as String? ?? '',
      rpcServerPort: json['rpcServerPort'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AppEnvToJson(_$_AppEnv instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'title': instance.title,
      'theme': instance.theme,
      'locale': instance.locale,
      'label': instance.label,
      'apiServer': instance.apiServer,
      'rpcServerIp': instance.rpcServerIp,
      'rpcServerPort': instance.rpcServerPort,
    };
