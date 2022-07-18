import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/ticker.dart';
import 'package:meta/meta.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  // CountdownBloc(this._ticker) : super(RedyCountdownState());

  final int _duration = 300;
  final Ticker _ticker;
  StreamSubscription<int> _timerSubscription;

  CountdownBloc({@required Ticker ticker})
      : _ticker = ticker,
        assert(ticker != null),
        super(RedyCountdownState(300));

  // @override
  // CountdownState get initialState => RedyCountdownState(_duration);

  @override
  void onTransition(Transition<CountdownEvent, CountdownState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<CountdownState> mapEventToState(CountdownEvent event) async* {
    if (event is StartCountdown) {
      yield* _mapStartcountdownTostate(event);
    } else if (event is PauseCountdown) {
      yield* _mapPausecountdownTostate(event);
    } else if (event is ResumeCountdown) {
      yield* _mapResumecountdownTostate(event);
    } else if (event is ResetCountdown) {
      yield* _mapResetcountdownTostate(event);
    } else if (event is Tick) {
      yield* _mapTickcountdownTostate(event);
    }
  }

  Stream<CountdownState> _mapStartcountdownTostate(
      StartCountdown start) async* {
    yield RunningCountdownState(start.duration);
    _timerSubscription?.cancel();
    _timerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(Tick(duration: duration)));
  }

  Stream<CountdownState> _mapPausecountdownTostate(
      PauseCountdown event) async* {
    if (state is RunningCountdownState) {
      _timerSubscription?.pause();
      yield PausedCountdownState(state.duration);
    }
  }

  Stream<CountdownState> _mapResumecountdownTostate(
      ResumeCountdown event) async* {
    if (state is PausedCountdownState) {
      _timerSubscription?.resume();
      yield RunningCountdownState(state.duration);
    }
  }

  Stream<CountdownState> _mapResetcountdownTostate(
      ResetCountdown event) async* {
    _timerSubscription?.cancel();
    yield RedyCountdownState(_duration);

    //yield timer?.cancel();
  }

  Stream<CountdownState> _mapTickcountdownTostate(Tick tick) async* {
    // Tick tick = event;
    yield tick.duration > 0
        ? RunningCountdownState(tick.duration)
        : FinishedCountdownState();
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
