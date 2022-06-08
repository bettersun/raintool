import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Scrollable extends ConsumerWidget {
  const Scrollable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> list = [];

    for (int i = 0; i < 30; i++) {
      list.add(
        TextButton(
          child: Text(
            i.toString() + "GWIOEUFGOIEUWGFOIUWEGFOIUWGEFOIUGEFIOUGWEIOUFGO",
            softWrap: false,
          ),
          onPressed: () {
            print(i.toString());
          },
        ),
      );
    }

    var inner = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: list,
      ),
    );

    var outer = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: inner,
    );

    return outer;
  }
}
