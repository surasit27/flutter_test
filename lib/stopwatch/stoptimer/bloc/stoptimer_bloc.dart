import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tests/stopwatch/stoptimer/page/ticker.dart';
import 'package:meta/meta.dart';

part 'stoptimer_event.dart';
part 'stoptimer_state.dart';

class StoptimerBloc extends Bloc<StoptimerEvent, StoptimerState> {
  final int _duration = 0;
  final Ticker _ticker;
  StreamSubscription<int> _timerSubscription;
  StoptimerBloc({@required Ticker ticker})
      : _ticker = ticker,
        assert(ticker != null),
        super(RedyStoptimerState(0));

  @override
  StoptimerState get initialState => RedyStoptimerState(_duration);
  @override
  void onTransition(Transition<StoptimerEvent, StoptimerState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<StoptimerState> mapEventToState(StoptimerEvent event) async* {
    if (event is StartStoptimer) {
      yield* _mapStoptimerTostate(event);
    } else if (event is PauseStoptimer) {
      yield* _mapPauseStoptimerTostate(event);
    } else if (event is ResumeStoptimer) {
      yield* _mapResumeStoptimerTostate(event);
    } else if (event is ResetStoptimer) {
      yield* _mapResetStoptimerTostate(event);
    } else if (event is Tick) {
      yield* _mapTickStoptimerTostate(event);
    }
  }

  Stream<StoptimerState> _mapStoptimerTostate(StartStoptimer start) async* {
    yield RunningStoptimerState(start.duration);
    _timerSubscription?.cancel();
    _timerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(Tick(duration: duration)));
  }

  Stream<StoptimerState> _mapPauseStoptimerTostate(
      PauseStoptimer event) async* {
    if (state is RunningStoptimerState) {
      _timerSubscription?.pause();
      yield PausedStoptimerState(state.duration);
    }
  }

  Stream<StoptimerState> _mapResumeStoptimerTostate(
      ResumeStoptimer event) async* {
    if (state is PausedStoptimerState) {
      _timerSubscription?.resume();
      yield RunningStoptimerState(state.duration);
    }
  }

  Stream<StoptimerState> _mapResetStoptimerTostate(
      ResetStoptimer event) async* {
    _timerSubscription?.cancel();
    yield RedyStoptimerState(_duration);

    //yield timer?.cancel();
  }

  Stream<StoptimerState> _mapTickStoptimerTostate(Tick tick) async* {
    // Tick tick = event;
    yield tick.duration > 0
        ? RunningStoptimerState(tick.duration)
        : FinishedStoptimerState();
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
