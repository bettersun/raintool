import 'package:flutter/material.dart';

import '../theme/rain_theme.dart';

class RainFrame extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const RainFrame({Key? key, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? RainTheme.paddingFrame,
      child: child,
    );
  }
}
