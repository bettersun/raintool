import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:raintool/common/env_util.dart';

import '../../_grpc/hello.pbgrpc.dart';
import '../../common/const.dart';
import '../../common/hive_util.dart';
import '../../common/rpc_util.dart';
import 'app_env.dart';

class AppEnvNotifier extends StateNotifier<AppEnv> {
  AppEnvNotifier(AppEnv? state) : super(state ?? AppEnv(themeData: ThemeData.light()));

  /// 初始化主题（从持久化文件中读取保存的主题标志）
  void init() async {
    String? apiServer = HiveUtil.appBox().get(HiveKey.apiServer);
    String? rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
    int? rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);

    String code = Code.i20000;
    String message = '';
    if (apiServer == null || rpcServerIp == null || rpcServerPort == null) {
      //
      code = Code.e90000;
      message = 'API 服务或 RPC 服务配置不正确';
      apiServer = '';
      rpcServerIp = '';
      rpcServerPort = 0;
    } else {
      // 检查 API 服务
      if (apiServer != null) {
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: apiServer,
            // connectTimeout: 10000,
            receiveTimeout: 20000,
            sendTimeout: 10000,
          ),
        );

        try {
          final response = await dio.get('/ping');
          if (response.statusCode == HttpStatus.ok) {
            message = 'API服务已连接。\n';
          }
        } catch (e) {
          code = Code.e90000;
          message = 'API服务不可用。请检查应用权限或确认API服务状况。';
        }
      }

      // 检查 PRC 服务
      if (code == Code.i20000 && rpcServerIp != null && rpcServerPort != null) {
        const name = 'rain tool init';
        int tryTime = 0;
        while (tryTime < Const.maxRpcConnecdtTimes) {
          try {
            // 检查 RPC 服务
            final ClientChannel channel = ClientChannel(
              rpcServerIp,
              port: rpcServerPort!,
              options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
            );

            final stub = GreeterClient(channel);

            final response = await stub.sayHello(
              HelloRequest()..name = name,
              // options: CallOptions(compression: const GzipCodec()),
            );

            // RPC 服务可用，设定应用的全局设置
            RpcUtil.setChannel(rpcServerIp, rpcServerPort);

            // 返回信息
            code = Code.i20000;
            if (tryTime == 0) {
              message = 'RPC服务已连接。端口: ' + rpcServerPort.toString();
            } else {
              message = 'RPC服务的配置端口无法使用。使用端口: ' + rpcServerPort.toString();
            }
            break;
          } catch (e) {
            // 端口 + 1
            rpcServerPort = rpcServerPort! + 1;
            code = Code.e90000;
            message = 'RPC服务的端口无法使用，正在尝试新端口: ' + rpcServerPort.toString();
          }
          tryTime = tryTime + 1;
        }

        // 已达最大尝试次数，RPC服务不可用。
        if (tryTime == Const.maxRpcConnecdtTimes) {
          code = Code.e90000;
          message = 'RPC服务不可用。';
        }
      }
    }

    state = state.copyWith(
      apiServer: apiServer,
      rpcServerIp: rpcServerIp,
      rpcServerPort: rpcServerPort!,
      code: code,
      message: message,
    );
  }

  /// 切换主题
  void toggle() {
    // 当前模式为明亮模式时，切换成黑暗模式
    if (state.theme == Const.light) {
      state = state.copyWith(
        theme: Const.dark,
        label: '切换到明亮模式',
        themeData: ThemeData.dark(),
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, Const.dark);
      return;
    }
    // 当前模式为黑暗模式时，切换成明亮模式
    if (state.theme == Const.dark) {
      state = state.copyWith(
        theme: Const.light,
        label: '切换到黑暗模式',
        themeData: ThemeData.light(),
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, Const.light);
      return;
    }
  }
}
