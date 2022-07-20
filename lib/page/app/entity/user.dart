import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// 应用配置
@freezed
class User with _$User {
  const factory User({
    @Default('') String userId, //  用户 ID
    @Default('') String name, // 用户名
    @Default('') String mail, // 邮件
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
