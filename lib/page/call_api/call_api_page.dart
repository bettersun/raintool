import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget/rain_back_button.dart';
import '../../common/widget/rain_frame.dart';
import 'entity/entity.dart';
import 'provider/call_api_provider.dart';

class CallApiPage extends ConsumerStatefulWidget {
  const CallApiPage({Key? key}) : super(key: key);

  @override
  CallApiPageState createState() => CallApiPageState();
}

class CallApiPageState extends ConsumerState<CallApiPage> {
  @override
  void initState() {
    super.initState();
    ref.read(callApiProvider.notifier).hello();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CallApiView>(callApiProvider, (prev, next) {
      if (next.statusCode != HttpStatus.ok) {
        showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(next.message),
            );
          },
        );
      }
    });

    final HelloInfo helloInfo = ref.watch(callApiProvider.select((view) => view.helloInfo));

    return Scaffold(
      body: RainFrame(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Message: ' + helloInfo.message),
              TextButton(
                child: const Text('Call API'),
                onPressed: () async {
                  ref.watch(callApiProvider.notifier).hello();
                },
              ),
              TextButton(
                child: const Text('Call API With Param'),
                onPressed: () async {
                  ref.watch(callApiProvider.notifier).helloParam('hello param');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const RainBackButton(),
    );
  }
}
