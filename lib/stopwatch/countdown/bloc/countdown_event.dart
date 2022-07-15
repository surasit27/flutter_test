part of 'countdown_bloc.dart';

@immutable
abstract class CountdownEvent {
  const CountdownEvent();
}

class StartCountdown extends CountdownEvent {
  final int duration;
  const StartCountdown({@required this.duration});
  @override
  String toString() => "StartCountdown{duration: $duration}";
}

class PauseCountdown extends CountdownEvent {
  @override
  String toString() => "StopCountdown";
}

class ResumeCountdown extends CountdownEvent {
  @override
  String toString() => "ResumeCountdown";
}

class ResetCountdown extends CountdownEvent {
  @override
  String toString() => "ResumeCountdown";
}

class LoadCountdown extends CountdownEvent {
  @override
  String toString() => "LoadCountdown";
}

class Tick extends CountdownEvent {
  final int duration;
  const Tick({@required this.duration});

  List<Object> get props => [duration];
  @override
  String toString() => "Tick {duration: $duration}";
}
