import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwi/kiwi.dart';

import 'app_service.dart';

final AppService service = KiwiContainer().resolve<AppService>();

final helloWorldProvider = FutureProvider<String>((ref) async {
  return await service.helloWorld();
});

final helloProvider = FutureProvider<String>((ref) async {
  return await service.helloWorld();
});
