import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/stopwatch/stoptimer/bloc/stoptimer_bloc.dart';

import 'home.dart';
import 'stopwatch/countdown/bloc/countdown_bloc.dart';
import 'stopwatch/countdown/bloc/countdown_observer.dart';
import 'stopwatch/countdown/ticker.dart';
import 'stopwatch/stoptimer/page/tickerstopwach.dart';

void main() {
  Bloc.observer = CountdownObserver();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countdown =
        BlocProvider(create: ((context) => CountdownBloc(ticker: Ticker())));
    final stoptimer = BlocProvider(
        create: ((context) =>
            StoptimerBloc(tickerStopWatch: TickerStopWatch())));
    return MultiBlocProvider(
        providers: [countdown, stoptimer],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.grey,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   // home: BlocProvider(
    //   //   create: (context) => CountdownBloc(ticker: Ticker()),
    //   //   child: CountdownPage(),
    //   // ),
    //   // home: BlocProvider(
    //   //   create: (context) => StoptimerBloc(ticker: TickerStopWatch()),
    //   //   child: StopWatchPage(),
    //   // ),
    // );
  }
}
