import 'package:riverpod/riverpod.dart';

class RefreshNotifier extends StateNotifier<bool> {
  RefreshNotifier() : super(false);

  void startRefresh() {
    state = true;
  }

  void finishRefresh() {
    state = false;
  }
}

final refreshProvider = StateNotifierProvider<RefreshNotifier, bool>((ref) {
  return RefreshNotifier();
});
