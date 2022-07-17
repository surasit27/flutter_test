import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tests/counter/bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget implements SaveCounterDelegate {
  // const MyHomePage({Key? key}) : super(key: key);
  CounterBloc _counterBloc;
  var _context;
  @override
  void onError(String message) {
   
    showAlertDialog(message);
  }

  @override
  void onSuccess(String message) {
   
    showAlertDialog(message);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _counterBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _counterBloc.add(LoadCounter());
              }),
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _counterBloc.add(SaveCounter(this));
              })
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        if (state is LoadedCounterState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          );
        }
        if (state is SaveCounterState || state is CounterInitialState) {
          _counterBloc.add(LoadCounter());
          return const SizedBox();
        }
        if (state is ErrorCounterState) {
          return Center(child: Text(state.error));
        }
        return const Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(const IncrementCounter(1));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.add(ResetCounter());
            },
            child: const Icon(Icons.restore),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(String message) {
    showDialog(
        context: _context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('close'))
            ],
          );
        });
  }
}
