import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_env.freezed.dart';
part 'app_env.g.dart';

/// 应用配置
@freezed
class AppEnv with _$AppEnv {
  const factory AppEnv({
    @Default('') String code, // 状态码
    @Default('') String message, // 消息
    @Default('') String title, // 应用标题
    @Default('') String theme, // 应用主题标志
    @JsonKey(ignore: true) @Default(null) ThemeData? themeData, // 应用主题
    @Default('') String locale, // 应用语言标志
    @Default('') String label, // 主题切换标签
    @Default('') String apiServer, // API服务 URL
    @Default('') String rpcServerIp, // RPC服务 IP
    @Default(0) int rpcServerPort, // RPC服务 端口
  }) = _AppEnv;

  factory AppEnv.fromJson(Map<String, Object?> json) => _$AppEnvFromJson(json);
}
