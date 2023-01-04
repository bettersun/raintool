import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/i18n/strings.g.dart';
import 'entity/app_env.dart';
import 'provider/app_provider.dart';

/// RainApp
class RainApp extends ConsumerStatefulWidget {
  const RainApp({Key? key}) : super(key: key);

  @override
  RainAppState createState() => RainAppState();
}

class RainAppState extends ConsumerState<RainApp> {
  @override
  void initState() {
    super.initState();
    // 初始化
    // ref.read(appEnvProvider.notifier).init();
    ref.read(appSettingProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    // 路由
    final router = ref.watch(routerProvider);

    // 应用配置
    final AppEnv appEnv = ref.watch(appEnvProvider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(appEnv.languageCode, appEnv.countryCode),
      supportedLocales: LocaleSettings.supportedLocales,
      theme: appEnv.themeData,
    );
  }
}
