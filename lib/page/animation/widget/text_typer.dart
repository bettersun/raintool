import 'dart:async';

import 'package:flutter/material.dart';

class TextTyper extends StatefulWidget {
  @override
  TextTyperState createState() => TextTyperState();
}

class TextTyperState extends State<TextTyper> {
  final Duration animDuration = const Duration(milliseconds: 200);

  final String text = '长风破浪会有时，直挂云帆济沧海。';

  final ValueNotifier<String> data = ValueNotifier<String>("");

  Timer? _timer;
  int currentIndex = 0;

  String get currentText => text.substring(0, currentIndex);

  @override
  void initState() {
    super.initState();
    _startAnim();
  }

  @override
  void dispose() {
    _timer?.cancel();
    data.dispose();
    super.dispose();
  }

  void _startAnim() {
    _timer?.cancel();
    data.value = '';
    currentIndex = 0;
    _timer = Timer.periodic(animDuration, _type);
  }

  void _type(Timer timer) {
    if (currentIndex < text.length) {
      currentIndex++;
      data.value = currentText;
    } else {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnim,
      child: SizedBox(
        width: 300,
        child: AnimatedBuilder(
          animation: data,
          builder: _buildByAnim,
        ),
      ),
    );
  }

  Widget _buildByAnim(_, __) => Text(
        data.value,
        style: const TextStyle(color: Colors.blue),
      );
}
