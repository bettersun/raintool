import 'package:kiwi/kiwi.dart';
import 'package:raintool/api/api_get_hello_world.dart';
import 'package:raintool/app/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  @override
  Future<String> helloWorld() async {
    final ApiGetHelloWorld api = KiwiContainer().resolve<ApiGetHelloWorld>();
    String s = await api.helloWorld();
    return s;
  }
}
