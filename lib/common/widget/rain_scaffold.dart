import 'package:flutter/material.dart';

class RainFrame extends StatelessWidget {
  final Widget? child;
  const RainFrame({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child ?? Container(),
    );
  }
}
