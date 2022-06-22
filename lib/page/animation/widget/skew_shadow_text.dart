import 'dart:math';

import 'package:flutter/material.dart';

class SkewShadowText extends StatefulWidget {
  const SkewShadowText({Key? key}) : super(key: key);

  @override
  SkewShadowTextState createState() => SkewShadowTextState();
}

class SkewShadowTextState extends State<SkewShadowText> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Duration animDuration = const Duration(milliseconds: 800);

  final TextStyle commonStyle = const TextStyle(fontSize: 60, color: Colors.blue);
  final TextStyle shadowStyle = TextStyle(fontSize: 60, color: Colors.blue.withAlpha(88));
  final String text = 'Hello, world';

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
        child: Stack(
          children: [
            Text(
              text,
              style: commonStyle,
            ),
            AnimatedBuilder(
              animation: _ctrl,
              builder: _buildByAnim,
            ),
          ],
        ));
  }

  double get rad => 6 * (_ctrl.value) / 180 * pi;

  Widget _buildByAnim(_, __) => Transform(
        transform: Matrix4.skewX(rad),
        child: Text(
          text,
          style: shadowStyle,
        ),
      );

  void _startAnim() {
    // 3. 启动动画器
    _ctrl.forward(from: 0);
  }
}
