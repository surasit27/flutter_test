part of 'countdown_bloc.dart';

@immutable
abstract class CountdownState {
  // final int duration;
  const CountdownState();

  //  List<Object> get props => [this.duration];
}

class RedyCountdownState extends CountdownState {
  // RedyCountdownState(int duration) : super(duration);
  //static const countDuration = Duration(minutes: 5);
  // final int duration;
  // const RedyCountdownState(this.duration);

  // @override
  // String toString() => "RedyCountdownState $duration";
}

class PausedCountdownState extends CountdownState {
  // PausedCountdownState(int duration) : super(duration);

  @override
  String toString() => "PausedCountdownState";
}

class RunningCountdownState extends CountdownState {
  final int duration;
  const RunningCountdownState(this.duration);
  @override
  String toString() => "RunningCountdownState $duration";
}

class FinishedCountdownState extends CountdownState {
  // FinishedCountdownState(int duration) : super(0);

  @override
  String toString() => "FinishedCountdownState";
}

class ErrorCountdownState extends CountdownState {
  final String error;
  const ErrorCountdownState(this.error);
  @override
  String toString() => "ErrorCountdownState $error";
}
