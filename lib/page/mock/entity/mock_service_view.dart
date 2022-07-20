import 'mock_service_info_view.dart';

/// 模拟服务View
class MockServiceView {
  /// 运行时信息
  /// 不同于模拟服务信息(MockServiceInfo)
  final String info;

  /// 目标主机列表
  final List<String> targetHostList;

  /// 默认目标主机
  final String defaultTargetHost;

  /// 模拟服务信息View列表
  final List<MockServiceInfoView> infoList;

  /// 服务运行中
  final bool isRunning;

  /// 全部使用默认目标主机标志
  final bool allUseDefaultTargetHost;

  /// 全部使用模拟服务标志
  final bool allUseMockService;

  /// Go端通知
  final List<String> notification;

  /// 通知可见标志
  final bool visibleNotification;

  const MockServiceView({
    this.info = '',
    this.targetHostList = const [],
    this.defaultTargetHost = '',
    this.infoList = const [],
    this.isRunning = false,
    this.allUseDefaultTargetHost = false,
    this.allUseMockService = false,
    this.notification = const [],
    this.visibleNotification = false,
  });

  @override
  List<Object> get props => [
        info,
        targetHostList,
        defaultTargetHost,
        allUseMockService,
        infoList,
        isRunning,
        allUseDefaultTargetHost,
        allUseMockService,
        notification,
        visibleNotification,
      ];

  MockServiceView copyWith({
    String? info,
    List<String>? targetHostList,
    String? defaultTargetHost,
    List<MockServiceInfoView>? infoList,
    bool? isRunning,
    bool? allUseDefaultTargetHost,
    bool? allUseMockService,
    List<String>? notification,
    bool? visibleNotification,
  }) {
    return MockServiceView(
      info: info ?? this.info,
      targetHostList: targetHostList ?? this.targetHostList,
      defaultTargetHost: defaultTargetHost ?? this.defaultTargetHost,
      infoList: infoList ?? this.infoList,
      isRunning: isRunning ?? this.isRunning,
      allUseDefaultTargetHost: allUseDefaultTargetHost ?? this.allUseDefaultTargetHost,
      allUseMockService: allUseMockService ?? this.allUseMockService,
      notification: notification ?? this.notification,
      visibleNotification: visibleNotification ?? this.visibleNotification,
    );
  }
}
