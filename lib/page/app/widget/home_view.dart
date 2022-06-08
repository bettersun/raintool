import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 ref 监听 provider
    // final counter = ref.watch(counterProvider);
    var view = SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            child: Text('Test'),
            onPressed: () {
              print('TextButton Pressed.');
            },
          ),
        ],
      ),
    );

    return view;
  }
}
