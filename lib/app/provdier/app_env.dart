import 'package:flutter/material.dart';

@immutable
class AppEnv {
  const AppEnv({
    this.code = '',
    this.message = '',
    this.title = '',
    this.theme = '',
    this.label = '',
    required this.themeData,
    this.apiServer = '',
    this.rpcServerIp = '',
    this.rpcServerPort = 0,
  });

  final String code;
  final String message;
  final String title;
  final String theme;
  final String label;
  final ThemeData themeData;
  final String apiServer;
  final String rpcServerIp;
  final int rpcServerPort;

  AppEnv copyWith({
    String? code,
    String? message,
    String? title,
    String? theme,
    String? label,
    ThemeData? themeData,
    String? apiServer,
    String? rpcServerIp,
    int? rpcServerPort,
  }) {
    return AppEnv(
      code: code ?? this.code,
      message: message ?? this.message,
      title: title ?? this.title,
      theme: theme ?? this.theme,
      label: label ?? this.label,
      themeData: themeData ?? this.themeData,
      apiServer: apiServer ?? this.apiServer,
      rpcServerIp: rpcServerIp ?? this.rpcServerIp,
      rpcServerPort: rpcServerPort ?? this.rpcServerPort,
    );
  }
}
