import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  // TODO: Timer count
  int _count = 0;

  // TODO: This is the initial count used to calculate the percent of the timer
  int initialCount = 0;

  // TODO: Used when the workout on screen get pause some how
  int _pauseCount = 0;

  // TODO: Here are the timers used
  Timer? _timer;
  Timer? _pauseTimer;

  // TODO: Used to start the timer
  void startTimer() {
    _count -= _pauseCount;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_count > 0) {
        _count--;
      } else {
        _count = 0;
        cancelTimer();
      }
      update();
    });
  }

  // Start pause timer
  void startPauseTimer() {
    _pauseCount = 0;
    _pauseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _pauseCount++;
    });
  }

  // Cancel Pause timer
  void cancelPauseTimer() {
    if (_pauseTimer != null) {
      _pauseTimer!.cancel();
    }
  }

  // Cancel timer
  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    // Cancel the count
    _count = 0;

    // Re-initialize the pause count for next use
    _pauseCount = 0;
  }

  // count getter and setter
  int get count => _count;
  set count(int count) {
    _count = count;
    update();
  }

  // pause count getter and setter
  int get pauseCount => _pauseCount;
  set pauseCount(int pauseCount) {
    _pauseCount = pauseCount;
    update();
  }

  // Used to reset the count
  // void reset() {
  //   _timer.cancel();
  //   _count = 0;
  // }
}
