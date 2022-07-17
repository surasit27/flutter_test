class Ticker {
  // Stream<int> tick({int ticks}) {
  //   Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1).take(ticks);
  // }

  // const Ticker();
  // Stream<int> tick({required int ticks}) {
  //   return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
  //       .take(ticks);

// }

  // const Ticker();
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);

    // Stream<int> tick({int ticks}) {
    //   return Stream<int>.periodic(
    //       const Duration(seconds: 1), (x) => ticks - x % (ticks + 1));
    // }
  }
}

// }
// const int ticks = 5;
// Stream<int>.periodic(
//         const Duration(seconds: 1), (x) => ticks - x % (ticks + 1))
//     .listen((value) => print(value));