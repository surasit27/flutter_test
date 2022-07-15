import 'package:flutter/material.dart';
import 'package:flutter_tests/stopwatch/countdown/page/countdown.dart';
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
          bottom: TabBar(tabs: [
            Tab(
              text: 'TIMER',
              icon: Icon(Icons.timer_outlined),
            ),
            Tab(
              text: 'STOPWATCH',
              icon: Icon(Icons.timelapse_rounded),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            CountdownPage(),
            StopWatchPage(),
          ],
        ),
      ),
    );
  }
}
