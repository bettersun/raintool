import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entity/call_api_view.dart';
import 'call_api_notifier.dart';

/// Provider
final callApiProvider = StateNotifierProvider<CallApiNotifier, CallApiView>((ref) {
  //
  return CallApiNotifier(const CallApiView());
});
