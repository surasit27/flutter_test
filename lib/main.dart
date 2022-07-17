import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_tests/counter/bloc/counter_bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/bloc/countdown_bloc.dart';
import 'package:flutter_tests/stopwatch/countdown/ticker.dart';

import 'stopwatch/countdown/page/countdown.dart';

void main() {
  //Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => CountdownBloc(ticker: Ticker()),
        child: CountdownPage(),
      ),
    );
  }
}
