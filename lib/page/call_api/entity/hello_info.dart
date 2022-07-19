import 'package:json_annotation/json_annotation.dart';

part 'hello_info.g.dart';

@JsonSerializable()
class HelloInfo {
  final String code;
  final String message;

  const HelloInfo({this.code = '', this.message = ''});

  factory HelloInfo.fromJson(Map<String, dynamic> json) => _$HelloInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HelloInfoToJson(this);
}
