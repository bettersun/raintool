import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NaviBar extends ConsumerWidget {
  int _currentIndex = 0;

  NaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: '1',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.email,
          ),
          label: '2',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pages,
          ),
          label: '3',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.airplay,
          ),
          label: '4',
          backgroundColor: Colors.blueAccent,
        )
      ],
      currentIndex: _currentIndex,
      onTap: (int index) {},
    );
  }
}
