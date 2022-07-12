part of 'counter_bloc.dart';

abstract class CounterState {
  const CounterState();

  // @override
  // List<Object> get props => [];
}

// class CounterInitial extends CounterState {}
class CounterInitialState extends CounterState {
  @override
  String toString() => "init CounterInitial";
}

class LoadingCounterState extends CounterState {
  @override
  String toString() => "init LoadingCounterState";
}

class LoadedCounterState extends CounterState {
  final int count;

  const LoadedCounterState(this.count);

  @override
  String toString() => "LoadedCounterState $count";
}

class SaveCounterState extends CounterState {
  final int count;

  const SaveCounterState(this.count);

  @override
  String toString() => "SaveCounterState $count";
}

class ErrorCounterState extends CounterState {
  final String error;

  const ErrorCounterState(this.error);

  @override
  String toString() => "ErrorCounterState $error";
}
