import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/user.dart';

/// https://github.com/lucavenir/go_router_riverpod
class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  /// 登录
  Future<void> login(String email, String password) async {
    // mock用户
    state = const User(
      name: "bettersun",
      mail: "bettersun@163.com",
    );
  }

  /// 注销
  Future<void> logout() async {
    state = null;
  }
}
