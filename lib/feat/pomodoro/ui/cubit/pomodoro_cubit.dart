import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/feat/pomodoro/config/settings.dart';
import 'package:learn/feat/pomodoro/ui/cubit/pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(InitPomodoroState());


  int sec = 0; // 60
  int min = 0;
  int hour = 0;

  bool timerIsWork = false;

  bool resetTime = false;

  Timer? timer;

  void start() {
   if (timerIsWork == false) {
      timer = Timer.periodic(Duration(seconds: 1), (t) {
        sec++;
        if (sec >= 60) {
          sec = 0;
          min++;
        }
        if (min >= 60) {
          min = 0;
          hour++;
        }
//============================================================
//================================================================

        if (min >= settings.workMin && resetTime == false) {
          resetTime = true;
          sec = 0;
          min = 0;
          hour = 0;
        } else if (min >= settings.resetMin && resetTime == true) {
          resetTime = false;
          sec = 0;
          min = 0;
          hour = 0;
        }

        emit(UpdatePomodoroState(sec: sec, min: min, hour: hour ,resetTime:resetTime  ));
      });
      timerIsWork = true;
    }
  }



  void pause() {
    if (timerIsWork == true) {
      timerIsWork = false;
      timer!.cancel();
    }
  }

  void restart() {
    sec = 0;
    min = 0;
    hour = 0;
    emit(UpdatePomodoroState(sec: sec, min: min, hour: hour , resetTime: resetTime));
  }
}
