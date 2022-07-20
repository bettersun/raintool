import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import '../entity/app_env.dart';
import '../service/app_service.dart';

class AppEnvNotifier extends StateNotifier<AppEnv> {
  AppEnvNotifier(AppEnv? state) : super(state ?? const AppEnv());

  final AppService service = KiwiContainer().resolve<AppService>();

  /// 初始化
  void init() async {
    state = await service.initAppEnv(state);
  }

  /// 切换主题
  void toggleTheme() {
    state = service.toggleTheme(state);
  }

  /// 切换语言
  void changeLocale() {
    state = service.changeLocale(state);
  }
}
