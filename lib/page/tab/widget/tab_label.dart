import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/tab_info.dart';

typedef TabLabelCloseEvent = void Function(String flag);

/// 标签设定页用 标签Label
class TabLabel extends ConsumerWidget {
  final TabItem item;
  final bool editMode;
  final bool enable;
  final TabLabelCloseEvent closeEvent;

  const TabLabel({
    required Key? key,
    required this.item,
    required this.editMode,
    required this.enable,
    required this.closeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String opMark = enable ? 'X' : '＋';

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3, top: 3),
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Text(item.flag),
        ),
        editMode
            ? GestureDetector(
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.lightBlueAccent,
                  child: Text(
                    opMark,
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ),
                onTap: () {
                  //
                  closeEvent(item.flag);
                },
              )
            : Container(),
      ],
    );
  }
}
