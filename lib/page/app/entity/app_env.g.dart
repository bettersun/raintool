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
      languageCode: json['languageCode'] as String? ?? 'en',
      countryCode: json['countryCode'] as String? ?? '',
      label: json['label'] as String? ?? '',
      apiHost: json['apiHost'] as String? ?? '',
      rpcServer: json['rpcServer'] as String? ?? '',
      rpcPort: json['rpcPort'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AppEnvToJson(_$_AppEnv instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'title': instance.title,
      'theme': instance.theme,
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
      'label': instance.label,
      'apiHost': instance.apiHost,
      'rpcServer': instance.rpcServer,
      'rpcPort': instance.rpcPort,
    };
