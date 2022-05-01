import 'package:kiwi/kiwi.dart';
import 'package:raintool/app/app_repository.dart';

import '../app_service.dart';

class AppServiceImpl extends AppService {
  @override
  Future<String> helloWorld() async {
    final AppRepository repo = KiwiContainer().resolve<AppRepository>();
    String s = await repo.helloWorld();
    return s;
  }
}
