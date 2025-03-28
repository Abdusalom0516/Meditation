import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditation/core/services/local_notification.dart';
import 'package:meditation/providers/timer_minute_provider.dart.dart';

class TimerSecondProvider extends StateNotifier<int> {
  TimerSecondProvider() : super(0);

  void initialize(int value) {
    state = value;
  }

  void start(WidgetRef ref, int minuteVal) async {
    while (ref.watch(timerMinuteProvider) > 0 || state > 0) {
      if (state == 0) {
        ref.read(timerMinuteProvider.notifier).decrement();
        state = 60;
      }
      state--;
      await Future.delayed(Duration(seconds: 1));
    }

    LocalNotification.showNotification('Time is up!');
    ref.read(timerMinuteProvider.notifier).initialize(minuteVal);
  }
}

final timerSecondProvider = StateNotifierProvider<TimerSecondProvider, int>(
    (ref) => TimerSecondProvider());
