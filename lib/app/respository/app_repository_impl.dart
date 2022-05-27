import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/services.dart';

import '../../common/const.dart';
import '../../common/util/hive_util.dart';
import '../../rpc/rpc_hello.dart';
import '../entity/app_setting.dart';
import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  Future<String> helloWorld() async {
    // final ApiGetHelloWorld api = KiwiContainer().resolve<ApiGetHelloWorld>();
    // String s = await api.helloWorld();
    //
    // return s;

    String s = await RpcHello().hello(["BS"]);

    return s;
  }

  @override
  Future<List<NaviItem>> loadMenu() async {
    final String s = await rootBundle.loadString(AssetConst.menu);
    final List m = const JsonDecoder().convert(s);

    final List<NaviItem> list = [];
    for (var item in m) {
      list.add(NaviItem.fromJson(item));
    }

    return list;
  }
}
