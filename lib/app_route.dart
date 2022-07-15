import 'package:flutter/material.dart';

import 'stopwatch/countdown/page/countdown.dart';
import 'stopwatch/stoptimer/page/stopwatch.dart';

class AppRoute {
  static const countdown = 'countdown';
  static const stopwatch = 'stopwatch';

  final _route = <String, WidgetBuilder>{
    countdown: (context) => CountdownPage(),
    stopwatch: (context) => StopWatchPage(),
  };

  get getall => _route;
}
