/// 常量
class AppConst {
  static const String title = 'Title';
  static const String defaultTitle = 'Rain Tool';

  /// 主题模式标志常量
  static const String dark = 'dark'; // 黑暗模式
  static const String light = 'light'; // 明亮模式

  /// 主题模式 标签
  static const String labelLight = '明亮模式'; // 明亮模式
  static const String labelDark = '黑暗模式'; // 黑暗模式

  /// RPC 最多尝试连接次数
  static const int maxRpcConnectTimes = 5;

  /// HTTP 默认连接超时时长（毫秒）
  static const int defaultConnectTimeout = 10000;

  /// HTTP 默认接收超时时长（毫秒）
  static const int defaultReceiveTimeout = 20000;

  /// HTTP 默认发送超时时长（毫秒）
  static const int defaultSendTimeout = 10000;
}
