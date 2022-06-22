import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// 动画页面文字
class AnimaText extends StatefulWidget {
  const AnimaText({Key? key}) : super(key: key);

  @override
  AnimaTextState createState() => AnimaTextState();
}

class AnimaTextState extends State<AnimaText> with SingleTickerProviderStateMixin {
  // 1. 声明动画器对象
  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 2000); // 动画时长

  final List<Color> colors = [
    const Color(0xFFF60C0C),
    const Color(0xFFF3B913),
    const Color(0xFFE7F716),
    const Color(0xFF3DF30B),
    const Color(0xFF0DF6EF),
    const Color(0xFF0829FB),
    const Color(0xFFB709F4),
  ];

  final List<double> pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

  Paint getPaint() {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
      Matrix4.rotationX(pi / 6).storage, // 旋转变换
    );
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 15 * _ctrl.value);
    return paint;
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: animDuration);
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
      child: AnimatedBuilder(animation: _ctrl, builder: _buildByAnim),
    );
  }

  Widget _buildByAnim(BuildContext context, Widget? child) {
    return Text(
      "Hello, World",
      style: TextStyle(fontSize: 60, foreground: getPaint()),
    );
  }

  void _startAnim() {
    // 3. 启动动画器
    _ctrl.forward(from: 0);
  }
}
