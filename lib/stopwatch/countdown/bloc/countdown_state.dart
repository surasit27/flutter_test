part of 'countdown_bloc.dart';

@immutable
abstract class CountdownState {
  final int duration;
  const CountdownState(this.duration);
  List<Object> get props => [duration];
}

class RedyCountdownState extends CountdownState {
  const RedyCountdownState(int duration) : super(duration);
  // final int duration;
  // const RedyCountdownState(this.duration);
  // @override
  // String toString() => "RedyCountdownState $duration";
}

class PausedCountdownState extends CountdownState {
  const PausedCountdownState(int duration) : super(duration);

  // final int duration;
  // const PausedCountdownState(this.duration);
  // @override
  // String toString() => "PausedCountdownState $duration";
}

class RunningCountdownState extends CountdownState {
  const RunningCountdownState(int duration) : super(duration);

  // final int duration;
  // const RunningCountdownState(this.duration);
  // @override
  // String toString() => "RunningCountdownState $duration";
}

class FinishedCountdownState extends CountdownState {
  const FinishedCountdownState(int duration) : super(0);

  // @override
  // String toString() => "FinishedCountdownState";
}

// class ErrorCountdownState extends CountdownState {
//   final String error;
//   const ErrorCountdownState(this.error);
//   @override
//   String toString() => "ErrorCountdownState $error";
// }
