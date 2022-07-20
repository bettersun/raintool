import 'package:equatable/equatable.dart';

import 'detail_response_view.dart';

/// 模拟服务信息详细View
class InfoDetailView extends Equatable {
  /// 运行时信息
  final String info;

  /// URL
  final String url;

  /// HTTP请求方法
  final String method;

  /// 目标主机
  final String targetHost;

  /// 当前使用的目标主机
  /// 使用默认目标主机为true时，表示 '默认目标主机'
  /// 使用默认目标主机为false时，表示当前的目标主机
  final String currentTargetHost;

  // /// 默认目标主机
  // final String defaultTargetHost;

  /// 使用默认目标主机
  final bool useDefaultTargetHost;

  /// 使用模拟服务
  final bool useMockService;

  /// 响应状态码
  final int statusCode;

  /// 响应状态码列表
  final List<String> statusCodeList;

  /// 响应文件
  final String responseFile;

  /// 说明
  final String description;

  /// 响应文件列表
  final List<DetailResponseView> responseList;

  const InfoDetailView({
    this.info = '',
    this.url = '',
    this.method = '',
    this.targetHost = '',
    this.currentTargetHost = '',
    // this.defaultTargetHost = '',
    this.useDefaultTargetHost = false,
    this.useMockService = false,
    this.statusCode = 0,
    this.statusCodeList = const [],
    this.responseFile = '',
    this.responseList = const [],
    this.description = '',
  });

  @override
  List<Object> get props => [
        info,
        url,
        method,
        targetHost,
        currentTargetHost,
        // defaultTargetHost,
        useDefaultTargetHost,
        useMockService,
        statusCode,
        statusCodeList,
        responseFile,
        responseList,
        description,
      ];

  InfoDetailView copyWith({
    String? info,
    String? url,
    String? method,
    String? targetHost,
    String? currentTargetHost,
    // String defaultTargetHost,
    bool? useDefaultTargetHost,
    bool? useMockService,
    List<String>? statusCodeList,
    int? statusCode,
    String? responseFile,
    List<DetailResponseView>? responseList,
    String? description,
  }) {
    return InfoDetailView(
      info: info ?? this.info,
      url: url ?? this.url,
      method: method ?? this.method,
      targetHost: targetHost ?? this.targetHost,
      currentTargetHost: currentTargetHost ?? this.currentTargetHost,
      // defaultTargetHost: defaultTargetHost ?? this.defaultTargetHost,
      useDefaultTargetHost: useDefaultTargetHost ?? this.useDefaultTargetHost,
      useMockService: useMockService ?? this.useMockService,
      statusCode: statusCode ?? this.statusCode,
      statusCodeList: statusCodeList ?? this.statusCodeList,
      responseFile: responseFile ?? this.responseFile,
      responseList: responseList ?? this.responseList,
      description: description ?? this.description,
    );
  }
}
