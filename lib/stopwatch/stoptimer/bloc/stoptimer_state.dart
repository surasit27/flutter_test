part of 'stoptimer_bloc.dart';

@immutable
abstract class StoptimerState {
  final int duration;
  const StoptimerState(this.duration);

  @override
  List<Object> get props => [duration];
}



class RedyStoptimerState extends StoptimerState {
  const RedyStoptimerState(int duration) : super(duration);

  @override
  String toString() => "RedyStoptimerState $duration";
}

class PausedStoptimerState extends StoptimerState {
  const PausedStoptimerState(int duration) : super(duration);

  @override
  String toString() => "PausedStoptimerState $duration";
}

class RunningStoptimerState extends StoptimerState {
  const RunningStoptimerState(int duration) : super(duration);

  @override
  String toString() => "RunningStoptimerState $duration";
}

class FinishedStoptimerState extends StoptimerState {
  const FinishedStoptimerState() : super(0);
}
