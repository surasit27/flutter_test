part of 'countdown_bloc.dart';

@immutable
abstract class CountdownState {
  final int duration;
  const CountdownState(this.duration);

  @override
  List<Object> get props => [duration];
}

class RedyCountdownState extends CountdownState {
  const RedyCountdownState(int duration) : super(duration);

  @override
  String toString() => "RedyCountdownState $duration";
}

class PausedCountdownState extends CountdownState {
  const PausedCountdownState(int duration) : super(duration);

  @override
  String toString() => "PausedCountdownState $duration";
}

class RunningCountdownState extends CountdownState {
  const RunningCountdownState(int duration) : super(duration);

  @override
  String toString() => "RunningCountdownState $duration";
}

class FinishedCountdownState extends CountdownState {
  const FinishedCountdownState() : super(0);
}
