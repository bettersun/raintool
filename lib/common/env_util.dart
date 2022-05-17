import 'dart:convert';

import 'package:flutter/services.dart';

import 'const.dart';
import 'hive_util.dart';

class EnvUtil {
  /// 读取 HTTP 和 RPC 设定，放到 Hive 中。
  static Future<void> loadEnv() async {
    final String sSetting = await rootBundle.loadString(Env.assetEnv);
    final Map<String, dynamic> mSetting = const JsonDecoder().convert(sSetting) as Map<String, dynamic>;

    // 应用标题
    HiveUtil.appBox().put(HiveKey.title, mSetting[Env.title]);

    // API IP:端口
    HiveUtil.appBox().put(HiveKey.apiServer, mSetting[Env.apiServer]);

    // RPC IP
    HiveUtil.appBox().put(HiveKey.rpcServerIp, mSetting[Env.rpcServerIp]);
    // RPC 端口
    HiveUtil.appBox().put(HiveKey.rpcServerPort, mSetting[Env.rpcServerPort]);
  }
}
