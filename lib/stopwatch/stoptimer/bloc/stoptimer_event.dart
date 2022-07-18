part of 'stoptimer_bloc.dart';

@immutable
abstract class StoptimerEvent {
  const StoptimerEvent();
  @override
  List<Object> get props => [];
}

class StartStoptimer extends StoptimerEvent {
  final int duration;
  const StartStoptimer({@required this.duration});
  @override
  String toString() => "StartStoptimer{duration: $duration}";
}

class PauseStoptimer extends StoptimerEvent {
  @override
  String toString() => "PauseStoptimer";
}

class ResumeStoptimer extends StoptimerEvent {
  @override
  String toString() => "ResumeStoptimer";
}

class ResetStoptimer extends StoptimerEvent {
  @override
  String toString() => "ResetStoptimer";
}

class TickStopwatch extends StoptimerEvent {
  final int duration;
  const TickStopwatch({@required this.duration});
  @override
  List<Object> get props => [duration];
  @override
  String toString() => "Tick {duration: $duration}";
}
