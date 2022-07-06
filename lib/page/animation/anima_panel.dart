import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import 'anima_painter.dart';
import 'point_data.dart';

/// 源自:
/// [张风捷特烈](https://juejin.cn/user/149189281194766)
/// [Flutter 动画探索 - 流光幻影](https://juejin.cn/book/6965102582473687071)
class AnimaPanel extends StatefulWidget {
  const AnimaPanel({Key? key}) : super(key: key);

  @override
  _AnimPanelState createState() => _AnimPanelState();
}

class _AnimPanelState extends State<AnimaPanel> with SingleTickerProviderStateMixin {
  PointData points = PointData();
  late AnimationController _ctrl;
  final Duration animDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: animDuration,
    )..addListener(_collectPoint);
    // curve = CurvedAnimation(parent: _ctrl, curve: Curves.bounceOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    points.dispose();
    super.dispose();
  }

  void _collectPoint() {
    points.push(_ctrl.value);
  }

  void _startAnim() async {
    points.clear();
    _ctrl.reset();
    print('fling start!---${DateTime.now().toIso8601String()}----------');
    await _ctrl.fling(
        velocity: 10,
        springDescription: SpringDescription.withDampingRatio(
          mass: 1.0,
          stiffness: 500.0,
          ratio: 3.0,
        ));
    print('fling end!---${DateTime.now().toIso8601String()}----------');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnim,
      child: CustomPaint(
        painter: AnimaPainter(points),
        size: const Size(
          200,
          200,
        ),
      ),
    );
  }
}
