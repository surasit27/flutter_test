import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/countdown_bloc.dart';

class CountdownPage extends StatefulWidget {
  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  CountdownBloc countdownBloc;
  @override
  void initState() {
    countdownBloc = BlocProvider.of<CountdownBloc>(context);
    // countdownBloc.add(StartCountdown(duration: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _context = context;
    //_countdownBloc = BlocProvider.of<CountdownBloc>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CountdownBloc, CountdownState>(
                builder: (context, state) {
              final String minutesSection = ((state.duration / 60) % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsSection =
                  (state.duration % 60).floor().toString().padLeft(2, '0');
              return Text(
                '$minutesSection : $secondsSection',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<CountdownBloc, CountdownState>(
              builder: ((context, state) => Actions()))
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToAction(
        countdownBloc: BlocProvider.of<CountdownBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToAction({CountdownBloc countdownBloc}) {
    final CountdownState countdownState = countdownBloc.state;
    if (countdownState is RedyCountdownState) {
      return [
        TextButton(
            onPressed: () {
              countdownBloc
                  .add(StartCountdown(duration: countdownState.duration));
            },
            child: Text(
              "START",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (countdownState is RunningCountdownState) {
      return [
        TextButton(
            onPressed: () {
              countdownBloc.add(PauseCountdown());
            },
            child: Text(
              "PAUSE",
              style: TextStyle(fontSize: 22),
            )),
        TextButton(
            onPressed: () {
              countdownBloc.add(ResetCountdown());
            },
            child: Text(
              "RESET",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (countdownState is PausedCountdownState) {
      return [
        TextButton(
            onPressed: () {
              countdownBloc.add(ResumeCountdown());
            },
            child: Text(
              "RESUME",
              style: TextStyle(fontSize: 22),
            )),
        TextButton(
            onPressed: () {
              countdownBloc.add(ResetCountdown());
            },
            child: Text(
              "RESET",
              style: TextStyle(fontSize: 22),
            ))
      ];
    }

    if (countdownState is FinishedCountdownState) {
      return [
        TextButton(
            onPressed: () {
              countdownBloc.add(ResetCountdown());
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
// BlocBuilder<CountdownBloc, CountdownState>(
          //   builder: (context, state) {
          //     if (state is RedyCountdownState) {
          //       return TextButton(
          //           onPressed: () {
          //             countdownBloc
          //                 .add(StartCountdown(duration: state.duration));
          //           },
          //           child: Text(
          //             "START",
          //             style: TextStyle(fontSize: 22),
          //           ));
          //     }
          //     if (state is PausedCountdownState) {
          //       return Row(
          //         children: [
          //           TextButton(
          //               onPressed: () {
          //                 countdownBloc.add(ResumeCountdown());
          //               },
          //               child: Text(
          //                 "PAUSEs",
          //                 style: TextStyle(fontSize: 22),
          //               )),
          //           TextButton(
          //               onPressed: () {
          //                 countdownBloc.add(ResetCountdown());
          //               },
          //               child: Text(
          //                 "RESET",
          //                 style: TextStyle(fontSize: 22),
          //               ))
          //         ],
          //       );
          //     }
          //     if (state is PausedCountdownState) {
          //       return Row(
          //         children: [
          //           TextButton(
          //               onPressed: () {
          //                 countdownBloc.add(ResumeCountdown());
          //               },
          //               child: Text(
          //                 "RESUME",
          //                 style: TextStyle(fontSize: 22),
          //               )),
          //           TextButton(
          //               onPressed: () {
          //                 countdownBloc.add(ResetCountdown());
          //               },
          //               child: Text(
          //                 "RESET",
          //                 style: TextStyle(fontSize: 22),
          //               ))
          //         ],
          //       );
          //     }
          //     if (state is FinishedCountdownState) {
          //       return TextButton(
          //           onPressed: () {
          //             countdownBloc.add(ResetCountdown());
          //           },
          //           child: Text(
          //             "REPLAY",
          //             style: TextStyle(fontSize: 22),
          //           ));
          //     }
          // return Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //   ],
          // );
          //},
          //)