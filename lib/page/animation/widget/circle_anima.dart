import 'dart:async';

import 'package:flutter/material.dart';

/// 圆形动画
class CircleAnima extends StatefulWidget {
  const CircleAnima({Key? key}) : super(key: key);

  @override
  CircleAnimaState createState() => CircleAnimaState();
}

class CircleAnimaState extends State<CircleAnima> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      // lowerBound: 32,
      // upperBound: 80,
      value: 0.4,
      vsync: this,
      duration: animDuration,
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _startAnim,
        onDoubleTap: _restartAnim,
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: _buildByAnim,
        ));
  }

  double get radius => 80 * _ctrl.value;
  // double get radius => _ctrl.value;

  Widget _buildByAnim(_, __) => Container(
        width: radius * 2,
        height: radius * 2,
        decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      );

  // 单击时开启重复动画
  void _startAnim() async {
    Timer(Duration(milliseconds: 1500), _stop);
    print('start!---${DateTime.now().toIso8601String()}----------');
    await _ctrl.repeat(reverse: true);
    print('done!---${DateTime.now().toIso8601String()}----------');
  }

// 停止动画
  void _stop() {
    _ctrl.stop();
  }

// 双击时反向开启动画
  void _restartAnim() {
    _ctrl.reverse();
  }
}
