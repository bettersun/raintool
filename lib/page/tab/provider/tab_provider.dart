import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/tab_info.dart';
import 'tab_notifier.dart';

/// 标签 Provider
final tabProvider = StateNotifierProvider<TabNotifier, TabInfo>((ref) {
  //
  return TabNotifier(const TabInfo());
});
