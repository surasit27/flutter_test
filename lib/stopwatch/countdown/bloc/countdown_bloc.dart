import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/ticker.dart';
import 'package:meta/meta.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  // CountdownBloc(this._ticker) : super(RedyCountdownState());
  CountdownBloc({@required Ticker ticker})
      : _ticker = ticker,
        super(null);

  final int _duration = 60;
  final Ticker _ticker;
  StreamSubscription _timerSubscription;
  CountdownState get initialState => RedyCountdownState(_duration);

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
      StartCountdown event) async* {
    StartCountdown startCountdown = event;
    yield RunningCountdownState(startCountdown.duration);
    print(startCountdown.duration);
    _timerSubscription?.cancel();
    _timerSubscription =
        _ticker.tick(ticks: startCountdown.duration).listen((duration) {
      add(Tick(duration: duration));
    });
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

  Stream<CountdownState> _mapTickcountdownTostate(Tick event) async* {
    Tick tick = event;
    yield tick.duration > 0
        ? RunningCountdownState(tick.duration)
        : FinishedCountdownState(tick.duration);
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
