import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/bloc/countdown_bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/page/countdown.dart';
import 'package:flutter_tests/stopwatch/stoptimer/bloc/stoptimer_bloc.dart';
import 'package:flutter_tests/stopwatch/stoptimer/page/stopwatch.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'TIMER',
                icon: Icon(Icons.timer_outlined),
              ),
              Tab(
                text: 'STOPWATCH',
                icon: Icon(Icons.timelapse_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<CountdownBloc, CountdownState>(
                builder: ((context, state) => CountdownPage())),
            BlocBuilder<StoptimerBloc, StoptimerState>(
                builder: ((context, state) => StopWatchPage())),
            // CountdownPage(),
            // StopWatchPage(),
          ],
        ),
      ),
    );
  }
}
