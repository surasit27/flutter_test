import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/bloc/countdown_bloc.dart';

class CountdownPage extends StatefulWidget {
  @override
  State<CountdownPage> createState() => CountdownPageState();
}

class CountdownPageState extends State<CountdownPage> {
  CountdownBloc _countdownBloc;
  var _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    _countdownBloc = BlocProvider.of(context);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: BlocBuilder<CountdownBloc, CountdownState>(
              builder: (context, state) {
                // final String minutesSection =
                //     ((statet)).floor().toString().padLeft(2, '0');

                // final String secondsSection =
                //     ((state.duration)).floor().toString().padLeft(2, '0');
                // return Text(
                //   '$minutesSection m : $secondsSection s',
                //   style: TextStyle(
                //     fontSize: 70,
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
