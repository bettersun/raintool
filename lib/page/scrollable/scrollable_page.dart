import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintool/common/widget.dart';

import '../../common/widget/rain_back_button.dart';

class ScrollablePage extends ConsumerWidget {
  const ScrollablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> list = [];

    for (int i = 0; i < 30; i++) {
      list.add(
        TextButton(
          child: Text(
            i.toString() + "辛苦遭逢起一经~干戈寥落四周星~山河破碎风飘絮~身世浮沉雨打萍~惶恐滩头滩头说惶恐~零丁洋里叹零丁~人生自古谁无死~留取丹心照汗青~",
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

    return Scaffold(
      body: RainFrame(
        child: SizedBox.expand(
          child: outer,
        ),
      ),
      floatingActionButton: const RainBackButton(),
    );
  }
}
