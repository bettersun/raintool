import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const.dart';
import '../../scrollable/scrollable_page.dart';
import '../../todo/todo_page.dart';
import '../entity/user.dart';
import '../home_page.dart';
import '../login_page.dart';
import '../setting_page.dart';
import 'app_provider.dart';

/// https://github.com/lucavenir/go_router_riverpod
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  /// This implementation exploits `ref.listen()` to add a simple callback that
  /// calls `notifyListeners()` whenever there's change onto a desider provider.
  RouterNotifier(this._ref) {
    _ref.listen<User?>(
      userProvider, // In our case, we're interested in the log in / log out events.
      (_, __) => notifyListeners(), // Obviously more logic can be added here
    );
  }

  /// IMPORTANT: conceptually, we want to use `ref.read` to read providers, here.
  /// GoRouter is already aware of state changes through `refreshListenable`
  /// We don't want to trigger a rebuild of the surrounding provider.
  String? redirectLogic(GoRouterState state) {
    final user = _ref.read(userProvider);

    // 路由是否为登录页面
    final areWeLoggingIn = state.location == '/login';

    // 未登录，跳转到登录页面
    if (user == null) {
      return areWeLoggingIn ? null : '/login';
    }

    // 已登录，访问登录页面的场合，直接跳转到主页。
    if (areWeLoggingIn) return '/';

    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          name: "home",
          path: '/',
          builder: (context, _) => const HomePage(),
        ),
        GoRoute(
          name: "login",
          path: RouterConst.pathLogin,
          builder: (context, _) => const LoginPage(),
        ),
        GoRoute(
          name: "scrollable",
          path: RouterConst.pathScrollable,
          builder: (context, _) => const ScrollablePage(),
        ),
        GoRoute(
          name: MenuConst.setting,
          path: RouterConst.pathSetting,
          builder: (context, _) => const SettingPage(),
        ),
        GoRoute(
          name: MenuConst.todo,
          path: RouterConst.pathTodo,
          builder: (context, _) => const TodoPage(),
        ),
      ];
}
