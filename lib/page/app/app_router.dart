import 'package:go_router/go_router.dart';
import 'package:raintool/page/mock/entity/mock_service_info_view.dart';

import '../../common/const.dart';
import '../animation/animation_page.dart';
import '../call_api/call_api_page.dart';
import '../login/login_page.dart';
import '../mock/mock_page.dart';
import '../mock_item/mock_item_page.dart';
import '../scrollable/scrollable_page.dart';
import '../tab/tab_page.dart';
import '../tab/tab_setting_page.dart';
import '../todo/todo_page.dart';
import 'home_page.dart';
import 'menu_setting_page.dart';
import 'setting_page.dart';

class AppRouter {
  static List<GoRoute> routes = [
    GoRoute(
      // name: "home",
      path: '/',
      builder: (context, _) => const HomePage(),
    ),
    GoRoute(
      // name: "login",
      path: RouterConst.pathLogin,
      builder: (context, _) => const LoginPage(),
    ),
    GoRoute(
      // name: "scrollable",
      path: RouterConst.pathScrollable,
      builder: (context, _) => const ScrollablePage(),
    ),
    GoRoute(
      // name: MenuConst.setting,
      path: RouterConst.pathSetting,
      builder: (context, _) => const SettingPage(),
    ),
    GoRoute(
      // name: MenuConst.todo,
      path: RouterConst.pathTodo,
      builder: (context, _) => const TodoPage(),
    ),
    GoRoute(
      path: RouterConst.pathMenuSetting,
      builder: (context, _) => const MenuSettingPage(),
    ),
    GoRoute(
      path: RouterConst.pathTabbar,
      builder: (context, _) => const TabPage(),
    ),
    GoRoute(
      path: RouterConst.pathTabbarSetting,
      builder: (context, _) => const TabSettingPage(),
    ),
    GoRoute(
      path: RouterConst.pathAnimation,
      builder: (context, _) => const AnimationPage(),
    ),
    GoRoute(
      path: RouterConst.pathCallApi,
      builder: (context, _) => const CallApiPage(),
    ),
    GoRoute(
      path: RouterConst.pathMock,
      builder: (context, _) => const MockPage(),
    ),
    GoRoute(
      path: RouterConst.pathMockItem,
      builder: (context, state) => MockItemPage(infoView: state.extra! as MockServiceInfoView),
    ),
  ];
}
