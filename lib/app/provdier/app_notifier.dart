import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../_grpc/hello.pbgrpc.dart';
import '../../_i18n/strings.g.dart';
import '../../common/const.dart';
import '../../common/hive_util.dart';
import '../../common/rpc_util.dart';
import 'app_env.dart';

class AppEnvNotifier extends StateNotifier<AppEnv> {
  AppEnvNotifier(AppEnv? state) : super(state ?? const AppEnv());

  /// 初始化
  void init() async {
    String code = Code.i20000;
    String message = '';

    // API / RPC 配置
    String? apiServer = HiveUtil.appBox().get(HiveKey.apiServer);
    String? rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
    int? rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);

    // API 或 RPC 配置不正确
    if (apiServer == null || rpcServerIp == null || rpcServerPort == null) {
      code = Code.e90000;
      message = 'API服务或RPC服务配置不正确';
      apiServer = '';
      rpcServerIp = '';
      rpcServerPort = 0;
    } else {
      // 检查 API 服务
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: apiServer,
          connectTimeout: Const.defaultConnectTimeout,
          receiveTimeout: Const.defaultReceiveTimeout,
          sendTimeout: Const.defaultSendTimeout,
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

      // 检查 PRC 服务
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

          // 创建 RPC 客户端
          final stub = GreeterClient(channel);

          // 请求 RPC 服务
          await stub.sayHello(
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

    state = state.copyWith(
      code: code,
      message: message,
      apiServer: apiServer,
      rpcServerIp: rpcServerIp,
      rpcServerPort: rpcServerPort!,
    );
  }

  /// 切换主题
  void toggle() {
    // 明亮模式 -> 黑暗模式
    if (state.theme == Const.light) {
      state = state.copyWith(
        theme: Const.dark,
        label: Const.labelLight,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, Const.dark);
      return;
    }
    // 黑暗模式 -> 明亮模式
    if (state.theme == Const.dark) {
      state = state.copyWith(
        theme: Const.light,
        label: Const.labelDark,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, Const.light);
      return;
    }
  }

  /// 切换语言
  void changeLocale() {
    switch (state.locale) {
      // 英语
      case Const.localEnUs:
        state = state.copyWith(
          // 汉语（中国）
          locale: Const.localZhCn,
        );
        break;
      // 汉语（中国）
      case Const.localZhCn:
        state = state.copyWith(
          // 汉语（香港）
          locale: Const.localZhHk,
        );
        break;
      // 汉语（香港）
      case Const.localZhHk:
        state = state.copyWith(
          // 日语
          locale: Const.localJaJp,
        );
        break;
      // 日语
      case Const.localJaJp:
        state = state.copyWith(
          // 英语
          locale: Const.localEnUs,
        );
        break;
      default:
        state = state.copyWith(
          // 默认语言
          locale: Const.localDefault,
        );
    }

    // 反映
    LocaleSettings.setLocaleRaw(state.locale);
    // 持久化
    HiveUtil.appBox().put(HiveKey.appLocale, state.locale);
  }
}
