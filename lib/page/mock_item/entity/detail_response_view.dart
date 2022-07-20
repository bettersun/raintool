import 'package:equatable/equatable.dart';

/// 模拟服务信息详细响应View
class DetailResponseView extends Equatable {
  /// JSON标志
  final bool isJson;

  /// JSON合法标志
  final bool isJsonValid;

  /// 响应文件
  final String responseFile;

  /// 文件名
  final String fileName;

  const DetailResponseView({
    this.isJson = false,
    this.isJsonValid = false,
    this.responseFile = '',
    this.fileName = '',
  });

  @override
  List<Object> get props => [
        isJson,
        isJsonValid,
        responseFile,
        fileName,
      ];

  DetailResponseView copyWith({
    bool? isResponse,
    bool? isJson,
    bool? isJsonValid,
    String? responseFile,
    String? fileName,
  }) {
    return DetailResponseView(
      isJson: isJson ?? this.isJson,
      isJsonValid: isJsonValid ?? this.isJsonValid,
      responseFile: responseFile ?? this.responseFile,
      fileName: fileName ?? this.fileName,
    );
  }
}
