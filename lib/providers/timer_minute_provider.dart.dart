import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerMinuteProvider extends StateNotifier<int> {
  TimerMinuteProvider() : super(0);

  void initialize(int value) {
    state = value;
  }

  void decrement() {
    state--;
  }
}

final timerMinuteProvider = StateNotifierProvider<TimerMinuteProvider, int>(
    (ref) => TimerMinuteProvider());
