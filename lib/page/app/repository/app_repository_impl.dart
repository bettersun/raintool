import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../common/const/asset_const.dart';
import '../../../rpc/rpc_hello.dart';
import '../entity/app_setting.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  Future<String> rpcHello() async {
    String s = await RpcHello().hello(["BS"]);

    return s;
  }

  @override
  Future<List<BMenuItem>> loadMenu() async {
    final String s = await rootBundle.loadString(AssetConst.menu);
    final List m = const JsonDecoder().convert(s);

    final List<BMenuItem> list = [];
    for (var item in m) {
      list.add(BMenuItem.fromJson(item));
    }

    return list;
  }
}
