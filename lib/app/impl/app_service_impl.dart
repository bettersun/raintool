import 'package:kiwi/kiwi.dart';
import 'package:raintool/app/app_repository.dart';

import '../app_service.dart';

class AppServiceImpl extends AppService {
  final AppRepository repo = KiwiContainer().resolve<AppRepository>();

  @override
  Future<String> helloWorld() async {
    return await repo.helloWorld();
  }

  @override
  bool checkEnv() {
    return repo.checkEnv();
  }
}
