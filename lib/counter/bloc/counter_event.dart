part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

abstract class SaveCounterDelegate {
  void onSuccess(String message);
  void onError(String message);
}

class IncrementCounter extends CounterEvent {
  final int count;
  const IncrementCounter(this.count);
  @override
  String toString() => "IncrementCounter{count: $count}";
}

class ResetCounter extends CounterEvent {
  @override
  String toString() => "ResetCounter";
}

class SaveCounter extends CounterEvent {
  final SaveCounterDelegate saveCounterDelegate;

  const SaveCounter(this.saveCounterDelegate);

  @override
  String toString() =>
      "SaveCounter {SaveCounterDelegate: $saveCounterDelegate}";
}

class LoadCounter extends CounterEvent {
  @override
  String toString() => "LoadCounter";
}
