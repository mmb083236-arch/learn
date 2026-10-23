sealed class PomodoroState {
  final bool resetTime;

  final int sec ;
  final int min;
  final int hour;

  new({required this.sec, required this.min, required this.hour , required this.resetTime});
}

final class InitPomodoroState extends PomodoroState{
  new() : super(hour: 0, min: 0 , sec: 0 , resetTime: false);

}

final class UpdatePomodoroState extends PomodoroState{
  new({required super.sec, required super.min, required super.hour ,  required super.resetTime});

}