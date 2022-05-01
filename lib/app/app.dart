import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/constant.dart';
import '../common/hive_util.dart';
import 'app_provider.dart';

class RainApp extends ConsumerWidget {
  const RainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> value = ref.watch(helloWorldProvider);

    final String title = value.when(
      data: (val) {
        return val;
      },
      error: (e, s) => 'ER',
      loading: () => 'Loading',
    );

    final String title2 = HiveUtil.appBox().get(Constant.title);

    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title + title2),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
    //
    // return value.when(
    //   data: (val) {
    //     return MaterialApp(
    //       // theme: ThemeData.dark(),
    //       home: Scaffold(
    //         appBar: AppBar(title: Text(val)),
    //         drawer: Drawer(
    //           child: ListView(
    //             // Important: Remove any padding from the ListView.
    //             padding: EdgeInsets.zero,
    //             children: [
    //               const DrawerHeader(
    //                 decoration: BoxDecoration(
    //                   color: Colors.blue,
    //                 ),
    //                 child: Text('Drawer Header'),
    //               ),
    //               ListTile(
    //                 title: const Text('Item 1'),
    //                 onTap: () {
    //                   // Update the state of the app.
    //                   // ...
    //                 },
    //               ),
    //               ListTile(
    //                 title: const Text('Item 2'),
    //                 onTap: () {
    //                   // Update the state of the app.
    //                   // ...
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //         body: const TodoPage(),
    //       ),
    //     );
    //   },
    //   error: (error, stack) => const MaterialApp(
    //     home: Scaffold(body: Text('Error')),
    //   ),
    //   loading: () => const MaterialApp(
    //     home: Scaffold(body: CircularProgressIndicator()),
    //   ),
    // );
  }
}
