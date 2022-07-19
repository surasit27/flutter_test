import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tests/stopwatch/stoptimer/page/tickerstopwach.dart';
import 'package:meta/meta.dart';

part 'stoptimer_event.dart';
part 'stoptimer_state.dart';

class StoptimerBloc extends Bloc<StoptimerEvent, StoptimerState> {
  final int _duration = 60000;
  final TickerStopWatch _tickerStopWatch;
  StreamSubscription<int> _timerSubscription;
  StoptimerBloc(
      {@required TickerStopWatch tickerStopWatch,
      TickerStopWatch tickStopatch,
      TickerStopWatch ticker})
      : _tickerStopWatch = tickerStopWatch,
        // assert(tickerStopWatch != null),
        super(RedyStoptimerState(60000));

  // @override
  // StoptimerState get initialState => RedyStoptimerState(_duration);
  @override
  void onTransition(Transition<StoptimerEvent, StoptimerState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<StoptimerState> mapEventToState(StoptimerEvent event) async* {
    if (event is StartStoptimer) {
      yield* _mapStarttimerTostate(event);
    } else if (event is PauseStoptimer) {
      yield* _mapPauseStoptimerTostate(event);
    } else if (event is ResumeStoptimer) {
      yield* _mapResumeStoptimerTostate(event);
    } else if (event is ResetStoptimer) {
      yield* _mapResetStoptimerTostate(event);
    } else if (event is TickStopwatch) {
      yield* _mapTickStoptimerTostate(event);
    }
  }

  Stream<StoptimerState> _mapStarttimerTostate(StartStoptimer start) async* {
    yield RunningStoptimerState(start.duration);
    _timerSubscription?.cancel();
    _timerSubscription = _tickerStopWatch
        .tick(ticks: start.duration)
        .listen((duration) => add(TickStopwatch(duration: duration)));
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

  Stream<StoptimerState> _mapTickStoptimerTostate(
      TickStopwatch tickStopwatch) async* {
    // Tick tick = event;
    yield tickStopwatch.duration > 0
        ? RunningStoptimerState(tickStopwatch.duration)
        : FinishedStoptimerState();
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
