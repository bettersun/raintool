import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/services.dart';

import 'const.dart';
import 'hive_util.dart';

class EnvUtil {
  // static EnvInfo? _envInfo;
  //
  // ///
  // static EnvInfo envInfo() {
  //   if (_envInfo != null) {
  //     return _envInfo!;
  //   }
  //
  //   String? apiServer = HiveUtil.appBox().get(HiveKey.apiServer);
  //   String? rpcServerIp = HiveUtil.appBox().get(HiveKey.rpcServerIp);
  //   int? rpcServerPort = HiveUtil.appBox().get(HiveKey.rpcServerPort);
  //
  //   return EnvInfo(
  //     apiServer: apiServer!,
  //     rpcServerIp: rpcServerIp!,
  //     rpcServerPort: rpcServerPort!,
  //   );
  // }

  /// 读取 HTTP 和 RPC 设定，放到 Hive 中。
  static Future<void> fetchEnv() async {
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

//
// @immutable
// class EnvInfo {
//   final String apiServer;
//   final String rpcServerIp;
//   final int rpcServerPort;
//
//   EnvInfo({required this.apiServer, required this.rpcServerIp, required this.rpcServerPort});
//
//   @override
//   String toString() {
//     return 'apiServer: ' + apiServer + ' rpcServerIp: ' + rpcServerIp + ' rpcServerPort: ' + rpcServerPort.toString();
//   }
// }
