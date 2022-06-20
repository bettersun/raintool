import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabInner extends ConsumerStatefulWidget {
  const TabInner({Key? key}) : super(key: key);

  @override
  TabInnerState createState() => TabInnerState();
}

class TabInnerState extends ConsumerState<TabInner> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
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
      primary: false,
      scrollDirection: Axis.horizontal,
      child: Column(
        children: list,
      ),
    );

    var outer = SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      child: inner,
    );

    double _lastMoveY = 0.0;
    double _downY = 0.0;

    return outer;
  }
}
