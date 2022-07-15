import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/countdown_bloc.dart';

class CountdownPage extends StatelessWidget {
  CountdownBloc _countdownBloc;
  // var _context;
  @override
  Widget build(BuildContext context) {
    // _context = context;
    _countdownBloc = BlocProvider.of<CountdownBloc>(context);
    return Scaffold(
      body: Column(
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
                '$minutesSection m : $secondsSection s',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
          BlocBuilder<CountdownBloc, CountdownState>(
            builder: (context, state) {
              if (state is RedyCountdownState) {
                return TextButton(
                    onPressed: () {
                      _countdownBloc
                          .add(StartCountdown(duration: state.duration));
                    },
                    child: Text(
                      "START",
                      style: TextStyle(fontSize: 22),
                    ));
              }
              if (state is PausedCountdownState) {
                return Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _countdownBloc.add(ResumeCountdown());
                        },
                        child: Text(
                          "PAUSEs",
                          style: TextStyle(fontSize: 22),
                        )),
                    TextButton(
                        onPressed: () {
                          _countdownBloc.add(ResetCountdown());
                        },
                        child: Text(
                          "RESET",
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                );
              }
              if (state is PausedCountdownState) {
                return Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _countdownBloc.add(ResumeCountdown());
                        },
                        child: Text(
                          "RESUME",
                          style: TextStyle(fontSize: 22),
                        )),
                    TextButton(
                        onPressed: () {
                          _countdownBloc.add(ResetCountdown());
                        },
                        child: Text(
                          "RESET",
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                );
              }
              if (state is FinishedCountdownState) {
                return TextButton(
                    onPressed: () {
                      _countdownBloc.add(ResetCountdown());
                    },
                    child: Text(
                      "REPLAY",
                      style: TextStyle(fontSize: 22),
                    ));
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

// class Action extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: _mapStateToAction(
//         countdownBloc: BlocProvider.of<CountdownBloc>(context),
//       ),
//     );
//   }

//   List<Widget> _mapStateToAction({CountdownBloc countdownBloc}) {
//     final CountdownState countdownState = countdownBloc.state;
//     if (countdownState is RedyCountdownState) {
//       return [
//         TextButton(
//             onPressed: () {
//               countdownBloc
//                   .add(StartCountdown(duration: countdownState.duration));
//             },
//             child: Text(
//               "START",
//               style: TextStyle(fontSize: 22),
//             ))
//       ];
//     }

//     if (countdownState is RunningCountdownState) {
//       return [
//         TextButton(
//             onPressed: () {
//               countdownBloc.add(PauseCountdown());
//             },
//             child: Text(
//               "PAUSE",
//               style: TextStyle(fontSize: 22),
//             )),
//         TextButton(
//             onPressed: () {
//               countdownBloc.add(ResetCountdown());
//             },
//             child: Text(
//               "RESET",
//               style: TextStyle(fontSize: 22),
//             ))
//       ];
//     }

//     if (countdownState is PausedCountdownState) {
//       return [
//         TextButton(
//             onPressed: () {
//               countdownBloc.add(ResumeCountdown());
//             },
//             child: Text(
//               "RESUME",
//               style: TextStyle(fontSize: 22),
//             )),
//         TextButton(
//             onPressed: () {
//               countdownBloc.add(ResetCountdown());
//             },
//             child: Text(
//               "RESET",
//               style: TextStyle(fontSize: 22),
//             ))
//       ];
//     }

//     if (countdownState is FinishedCountdownState) {
//       return [
//         TextButton(
//             onPressed: () {
//               countdownBloc.add(ResetCountdown());
//             },
//             child: Text(
//               "REPLAY",
//               style: TextStyle(fontSize: 22),
//             )),
//       ];
//     }
//     return [];
//   }
// }
