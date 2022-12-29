import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:kiwi/kiwi.dart';

import '../../../common/const.dart';
import '../../../common/i18n/strings.g.dart';
import '../../../common/util.dart';
import '../../../rpc/entity/hello.pbgrpc.dart';
import '../entity/entity.dart';
import '../repository/app_repository.dart';
import '../util/app_util.dart';
import 'app_service.dart';

class AppServiceImpl extends AppService {
  final AppRepository repo = KiwiContainer().resolve<AppRepository>();

  @override
  Future<AppEnv> initAppEnv(AppEnv state) async {
    String code = BizCode.c1001;
    String message = '';

    // API / RPC 配置
    String? apiHost = HiveUtil.appBox().get(HiveKey.apiHost);
    String? rpcServer = HiveUtil.appBox().get(HiveKey.rpcServer);
    int? rpcPort = HiveUtil.appBox().get(HiveKey.rpcPort);

    // API 或 RPC 配置不正确
    if (apiHost == null || rpcServer == null || rpcPort == null) {
      code = BizCode.e9001;
      message = 'API服务或RPC服务配置不正确';
      apiHost = '';
      rpcServer = '';
      rpcPort = 0;

      return state.copyWith(
        code: code,
        message: message,
        apiHost: apiHost,
        rpcServer: rpcServer,
        rpcPort: rpcPort,
      );
    }

    List<String> messages = [];

    // 检查 API 服务 START
    bool isHttpOk = true;
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: apiHost,
        connectTimeout: AppConst.defaultConnectTimeout,
        receiveTimeout: AppConst.defaultReceiveTimeout,
        sendTimeout: AppConst.defaultSendTimeout,
      ),
    );

    try {
      final response = await dio.get('/ping');
      if (response.statusCode == HttpStatus.ok) {
        messages.add('API服务已连接。');
      }
    } catch (e) {
      isHttpOk = false;
      code = BizCode.e9001;
    }
    // 检查 API 服务 END

    // 检查 PRC 服务 START
    bool isRpcOk = true;
    const name = 'rain tool init';
    int tryTime = 0;
    while (tryTime < AppConst.maxRpcConnectTimes) {
      try {
        // 检查 RPC 服务
        final ClientChannel channel = ClientChannel(
          rpcServer,
          port: rpcPort!,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

        // 创建 RPC 客户端
        final stub = RainServiceClient(channel);

        // 请求 RPC 服务
        await stub.hello(
          HelloRequest()..name = name,
          // options: CallOptions(compression: const GzipCodec()),
        );

        // RPC 服务可用，设定应用的全局设置
        RpcUtil.setChannel(rpcServer, rpcPort);

        // 返回信息
        code = BizCode.c1001;
        if (tryTime == 0) {
          messages.add('RPC服务已连接。端口: ' + rpcPort.toString());
        } else {
          messages.add('RPC服务的配置端口无法使用。使用端口: ' + rpcPort.toString());
        }
        break;
      } catch (e) {
        // 端口 + 1
        rpcPort = rpcPort! + 1;
        code = BizCode.e9001;
        debugPrint('RPC服务的端口无法使用，正在尝试新端口: ' + rpcPort.toString());
      }

      // 重试次数 + 1
      tryTime = tryTime + 1;
    }

    // 已达最大尝试次数，RPC服务不可用。
    if (tryTime == AppConst.maxRpcConnectTimes) {
      isRpcOk = false;
      code = BizCode.e9001;
    }

    if (!isHttpOk) {
      messages.add('API服务不可用。请检查应用权限或确认API服务状况。');
    }
    if (!isRpcOk) {
      messages.add('RPC服务不可用。');
    }

    String msg = '';
    for (String item in messages) {
      msg = msg + item;
    }
    // 检查 PRC 服务 END

    return state.copyWith(
      code: code,
      message: msg,
      apiHost: apiHost,
      rpcServer: rpcServer,
      rpcPort: rpcPort!,
    );
  }

  @override
  Future<String> rpcHello() async {
    return await repo.rpcHello();
  }

  @override
  AppEnv toggleTheme(AppEnv state) {
    // 明亮模式 -> 黑暗模式
    if (state.theme == AppConst.light) {
      state = state.copyWith(
        theme: AppConst.dark,
        themeData: ThemeData.dark(),
        label: AppConst.labelDark,
        message: AppConst.labelDark,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, AppConst.dark);
      return state;
    }
    // 黑暗模式 -> 明亮模式
    if (state.theme == AppConst.dark) {
      state = state.copyWith(
        theme: AppConst.light,
        themeData: ThemeData.light(),
        label: AppConst.labelLight,
        message: AppConst.labelLight,
      );

      // 持久化
      HiveUtil.appBox().put(HiveKey.appTheme, AppConst.light);
      return state;
    }

    return state;
  }

  @override
  AppEnv changeLocale(AppEnv state) {
    switch (state.locale) {
      // 英语
      case AppConst.localEnUs:
        state = state.copyWith(
          // 汉语（中国大陆）
          locale: AppConst.localZhCn,
          message: '汉语（中国大陆）',
        );
        break;
      // 汉语（中国大陆）
      case AppConst.localZhCn:
        state = state.copyWith(
          // 汉语（中国香港）
          locale: AppConst.localZhHk,
          message: '汉语（中国香港）',
        );
        break;
      // 汉语（中国香港）
      case AppConst.localZhHk:
        state = state.copyWith(
          // 日语
          locale: AppConst.localJaJp,
          message: '日语',
        );
        break;
      // 日语
      case AppConst.localJaJp:
        state = state.copyWith(
          // 英语
          locale: AppConst.localEnUs,
          message: '英语',
        );
        break;
      default:
        state = state.copyWith(
          // 默认语言
          locale: AppConst.localDefault,
          message: '默认',
        );
    }

    // 反映
    LocaleSettings.setLocaleRaw(state.locale);
    // 持久化
    HiveUtil.appBox().put(HiveKey.appLocale, state.locale);

    return state;
  }

  @override
  Future<AppSetting> initAppSetting(AppSetting state) async {
    List<BMenuItem> list = await repo.loadMenu();

    // 菜单项目
    // 排序
    list.sort((a, b) => a.orderNum.compareTo(b.orderNum));

    final List<BMenuItem> mList = [];

    int j = 0;
    for (BMenuItem item in list) {
      if (item.enabled) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        String path = AppUtil.routerPath(item.flag);
        mList.add(item.copyWith(
          index: j,
          icon: iconData,
          path: path,
        ));
        j++;
      }
    }

    // 底边栏项目
    // 排序
    list.sort((a, b) => a.naviOrder.compareTo(b.naviOrder));

    final List<BMenuItem> nList = [];

    int i = 0;
    for (BMenuItem item in list) {
      if (item.naviItem) {
        IconData iconData = AppUtil.loadIconData(item.flag);
        String path = AppUtil.routerPath(item.flag);
        nList.add(item.copyWith(
          index: i,
          icon: iconData,
          path: path,
        ));
        i++;
      }
    }

    bool showNavibar = HiveUtil.appBox().get(HiveKey.showNavibar) ?? false;
    // 底边栏项目数少于2时，不显示底边栏
    if (nList.length < 2) {
      showNavibar = false;
    }

    //
    state = state.copyWith(
      menuItemList: mList,
      naviItemList: nList,
      showNavibar: showNavibar,
    );

    return state;
  }

  @override
  AppSetting toggleNavibar(AppSetting state) {
    final bool showNavibar = !state.showNavibar;
    HiveUtil.appBox().put(HiveKey.showNavibar, showNavibar);
    return state.copyWith(showNavibar: showNavibar);
  }

  @override
  AppSetting changeMenu(AppSetting state, int index) {
    // 对应的底边栏下标
    int naviIndex = 0; // 下标 > 0
    BMenuItem m = state.menuItemList[index];
    for (BMenuItem item in state.naviItemList) {
      if (m.flag == item.flag) {
        naviIndex = item.index;
      }
    }

    return state.copyWith(
      selectedMenuIndex: index,
      selectedNaviIndex: naviIndex,
    );
  }

  @override
  AppSetting changeNavi(AppSetting state, int index) {
    // 对应的菜单下标
    int menuIndex = -1; // 默认不选中
    BMenuItem n = state.naviItemList[index];
    for (BMenuItem item in state.menuItemList) {
      if (n.flag == item.flag) {
        menuIndex = item.index;
      }
    }

    return state.copyWith(
      selectedMenuIndex: menuIndex,
      selectedNaviIndex: index,
    );
  }

  @override
  AppSetting reorderMenuItem(AppSetting state, int oldIndex, int newIndex) {
    List<BMenuItem> newMenuItemList = [];
    for (var item in state.menuItemList) {
      newMenuItemList.add(item);
    }

    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }

    var element = newMenuItemList.removeAt(oldIndex);
    newMenuItemList.insert(newIndex, element);

    //  TODO: 持久化

    return state.copyWith(menuItemList: newMenuItemList);
  }
}
