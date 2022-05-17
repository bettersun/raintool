/// 常量
class Const {
  static const String title = 'Title';
  static const String defaultTitle = 'Rain Tool';

  /// 主题模式标志常量
  static const String dark = 'dark'; // 黑暗模式
  static const String light = 'light'; // 明亮模式

  /// 主题模式 标签
  static const String labelLight = '明亮模式'; // 明亮模式
  static const String labelDark = '黑暗模式'; // 黑暗模式

  /// 语言
  static const String localEnUs = 'en-US';
  static const String localZhCn = 'zh-CN';
  static const String localZhHk = 'zh-HK';
  static const String localJaJp = 'ja-JP';
  static const String localDefault = localEnUs; // 默认：英语

  /// RPC 最多尝试连接次数
  static const int maxRpcConnecdtTimes = 5;

  /// HTTP 默认连接超时时长（毫秒）
  static const int defaultConnectTimeout = 10000;

  /// HTTP 默认接收超时时长（毫秒）
  static const int defaultReceiveTimeout = 20000;

  /// HTTP 默认发送超时时长（毫秒）
  static const int defaultSendTimeout = 10000;
}
