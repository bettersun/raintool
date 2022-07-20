import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget.dart';
import 'anima_panel.dart';
import 'widget/anima_text.dart';
import 'widget/circle_anima.dart';
import 'widget/skew_shadow_text.dart';
import 'widget/text_typer.dart';

/// https://s.juejin.cn/ds/YaS6mLP/
/// 动画页面
class AnimationPage extends ConsumerStatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  AnimationPageState createState() => AnimationPageState();
}

class AnimationPageState extends ConsumerState<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            const Text('学习：Flutter 动画探索 - 流光幻影 - 张风捷特烈 '),
            const Text('https://juejin.cn/book/6965102582473687071 '),
            const Text('https://juejin.cn/user/149189281194766 '),
            const AnimaText(),
            const SkewShadowText(),
            TextTyper(),
            const CircleAnima(),
            const AnimaPanel(),
          ],
        ),
      ),
      floatingActionButton: const RainBackButton(),
    );
  }
}
