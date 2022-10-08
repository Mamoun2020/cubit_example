import 'package:cubit_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    // BlocProvider.of<CounterCubit>(context).incrementCounter();
    context.read<CounterCubit>().incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (_, state) {
                if (state is CounterIsIncremented) {}
                Fluttertoast.showToast(
                  msg:
                      'Counter: ${BlocProvider.of<CounterCubit>(context).counter}',
                );
              },
              builder: (_, state) {
                return Text(
                  context.watch<CounterCubit>().counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            // BlocListener<CounterCubit,CounterState>(
            //   listener: (_,state){
            //     if(state is CounterIsIncremented){
            //       Fluttertoast.showToast(msg:
            //           BlocProvider.of<CounterCubit>(context).counter.toString(),
            //       );
            //     }
            //   },
            //   child: BlocBuilder<CounterCubit,CounterState>(
            //     builder: (_,state) {
            //       return Text(
            //         BlocProvider.of<CounterCubit>(context).counter.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     },
            //   ),
            // ),
            // BlocBuilder<CounterCubit,CounterState>(
            //   builder: (_,state) {
            //     return Text(
            //       BlocProvider.of<CounterCubit>(context).counter.toString(),
            //       style: Theme.of(context).textTheme.headline4,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
