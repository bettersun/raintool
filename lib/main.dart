import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 创建一个 "provider"，它会存储一个值 （在这里是 "Hello world"）。
// 通过使用 provider， 这使我们可以模拟/覆写暴露的值。
final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    // 为了使组件能读取 provider ，我们需要将整个应用包装在一个 "ProviderScope" 组件中。
    // 这是 provider 的状态要存储的地方。
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// 继承 ConsumerWidget 而不是 StatelessWidget，它是 Riverpod 中暴露的组件。
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}
