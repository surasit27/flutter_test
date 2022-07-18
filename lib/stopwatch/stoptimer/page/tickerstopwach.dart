class TickerStopWatch {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(milliseconds: 1), (x) => ticks + x)
        .take(ticks);
  }
}
