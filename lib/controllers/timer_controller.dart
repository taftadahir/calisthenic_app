import 'dart:async';

import 'package:calisthenic_app/constants/route_constant.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  int _count = 0;
  int initialCount = -1;
  int _pauseCount = 0;
  late Timer _timer;
  late Timer _pauseTimer;

  void start() {
    _count -= _pauseCount;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count > 0) {
        _count--;
      } else {
        _count = 0;
        _timer.cancel();
      }
      update();
    });
  }

  void startPause() {
    _pauseCount = 0;
    _pauseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _pauseCount++;
    });
  }

  void pauseForPause() {
    _pauseTimer.cancel();
  }

  void pause() {
    _timer.cancel();
    _pauseCount = 0;
  }

  int get count => _count;
  set count(int count) {
    _count = count;
    update();
  }

  int get pauseCount => _pauseCount;
  set pauseCount(int countpauseCount) {
    _pauseCount = countpauseCount;
    update();
  }

  void reset() {
    _timer.cancel();
    _count = 0;
  }
}
