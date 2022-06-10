import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/page/app/provdier/app_provider.dart';

import '../../common/i18n/strings.g.dart';

/// 登录
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.login),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: Text(t.login),
              onPressed: () {
                ref.read(userProvider.notifier).login(
                      "bettersun",
                      "123456",
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
