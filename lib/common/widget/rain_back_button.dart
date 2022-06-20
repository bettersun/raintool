import 'package:flutter/material.dart';

class RainBackButton extends StatelessWidget {
  const RainBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
