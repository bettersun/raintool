import 'package:equatable/equatable.dart';

/// 模拟服务信息View
class MockServiceInfoView extends Equatable {
  /// URL
  final String url;

  /// HTTP请求方法
  final String method;

  /// 目标主机
  final String targetHost;

  /// 当前使用的目标主机
  /// 使用默认目标主机为true时，表示默认目标主机
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

  /// 可见性
  final bool visible;

  const MockServiceInfoView({
    this.url = '',
    this.method = '',
    this.targetHost = '',
    this.currentTargetHost = '',
    this.useDefaultTargetHost = false,
    this.useMockService = false,
    this.statusCode = 0,
    this.statusCodeList = const [],
    this.responseFile = '',
    this.description = '',
    this.visible = false,
  });

  @override
  List<Object> get props => [
        url,
        method,
        targetHost,
        currentTargetHost,
        useDefaultTargetHost,
        useMockService,
        statusCode,
        statusCodeList,
        responseFile,
        description,
        visible,
      ];

  MockServiceInfoView copyWith({
    String? url,
    String? method,
    String? targetHost,
    String? currentTargetHost,
    bool? useDefaultTargetHost,
    bool? useMockService,
    int? statusCode,
    List<String>? statusCodeList,
    String? responseFile,
    String? description,
    bool? visible,
  }) {
    return MockServiceInfoView(
      url: url ?? this.url,
      method: method ?? this.method,
      targetHost: targetHost ?? this.targetHost,
      currentTargetHost: currentTargetHost ?? this.currentTargetHost,
      useDefaultTargetHost: useDefaultTargetHost ?? this.useDefaultTargetHost,
      useMockService: useMockService ?? this.useMockService,
      statusCode: statusCode ?? this.statusCode,
      statusCodeList: statusCodeList ?? this.statusCodeList,
      responseFile: responseFile ?? this.responseFile,
      description: description ?? this.description,
      visible: visible ?? this.visible,
    );
  }
}
