import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tests/counter/bloc/counter_bloc.dart';
import 'package:meta/meta.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  CountdownBloc() : super(CountdownInitialState());
  // final int _duration = 60;
  // final Ticker _ticker;
  // StreamSubscription<int> _tickerSubscription;

  // CountdownBloc({@required Ticker ticker}) : _ticker = ticker, super(null);
  Duration duration = const Duration();
  Timer timer;
  static const countdurution = Duration(minutes: 5);
  bool isConuntdown = true;

  //  final int countDuration = 5;
  // @override
//  CountdownState get initialState => RedyCountdownState();

  // void reset() {
  //   if (isConuntdown) {
  //     duration = countDuration;
  //   } else {
  //     duration = const Duration();
  //   }
  // }

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
    }
  }

  Stream<CountdownState> _mapStartcountdownTostate(
      StartCountdown event) async* {
    try {
      yield RedyCountdownState()
      //yield RunningCountdownState();
      // if (resets) {
      //   reset();
      // }
      // timer = Timer.periodic(const Duration(seconds: 1), (_) {
      //   final addSecons = isConuntdown ? -1 : 1;
      //   final seconds = duration.inSeconds + addSecons;
      //   if (seconds < 0) {
      //     timer?.cancel();
      //   } else {
      //     duration = Duration(seconds: seconds);
      //   }
      // });
      //yield RunningCountdownState(duration);
    } catch (e) {}
  }

  Stream<CountdownState> _mapPausecountdownTostate(
      PauseCountdown event) async* {
    try {
      //yield timer?.cancel();
    } catch (e) {}
  }

  Stream<CountdownState> _mapResumecountdownTostate(
      ResumeCountdown event) async* {
    try {
      //yield timer?.cancel();
    } catch (e) {}
  }

  Stream<CountdownState> _mapResetcountdownTostate(
      ResetCountdown event) async* {
    try {
      //yield timer?.cancel();
    } catch (e) {}
  }
}

CountdownState CountdownInitialState() {}
