import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/stopwatch/stoptimer/bloc/stoptimer_bloc.dart';

class StopWatchPage extends StatefulWidget {
  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  StoptimerBloc stoptimerBloc;
  @override
  void initState() {
    stoptimerBloc = BlocProvider.of<StoptimerBloc>(context);
    // stoptimerBloc.add(StartStoptimer(duration: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<StoptimerBloc, StoptimerState>(
                builder: (context, state) {
              final String minutesSection = ((state.duration % 60) / 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsSection =
                  (state.duration % 60).floor().toString().padLeft(2, '0');
              // final String millisecondSection =
              //     (state.duration % 1000).floor().toString().padLeft(3, '0');

              return Text(
                '$minutesSection m : $secondsSection s ',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          BlocBuilder<StoptimerBloc, StoptimerState>(
              builder: ((context, state) => ActionStopwatch()))
        ],
      ),
    );
  }
}

class ActionStopwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToActionStopwatch(
        stoptimerBloc: BlocProvider.of<StoptimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionStopwatch({StoptimerBloc stoptimerBloc}) {
    final StoptimerState stoptimerState = stoptimerBloc.state;
    if (stoptimerState is RedyStoptimerState) {
      return [
        TextButton(
            onPressed: () {
              stoptimerBloc
                  .add(StartStoptimer(duration: stoptimerState.duration));
            },
            child: Text(
              "START",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (stoptimerState is RunningStoptimerState) {
      return [
        TextButton(
            onPressed: () {
              stoptimerBloc.add(PauseStoptimer());
            },
            child: Text(
              "PAUSE",
              style: TextStyle(fontSize: 22),
            )),
        TextButton(
            onPressed: () {
              stoptimerBloc.add(ResetStoptimer());
            },
            child: Text(
              "RESET",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (stoptimerState is PausedStoptimerState) {
      return [
        TextButton(
            onPressed: () {
              stoptimerBloc.add(ResumeStoptimer());
            },
            child: Text(
              "RESUME",
              style: TextStyle(fontSize: 22),
            )),
        TextButton(
            onPressed: () {
              stoptimerBloc.add(ResetStoptimer());
            },
            child: Text(
              "RESET",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (stoptimerState is FinishedStoptimerState) {
      return [
        TextButton(
            onPressed: () {
              stoptimerBloc.add(ResetStoptimer());
            },
            child: Text(
              "REPLAY",
              style: TextStyle(fontSize: 22),
            )),
      ];
    }
    return [];
  }
}
