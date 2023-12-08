import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increasedBy(value);
  }

  void resetCounter(BuildContext context) {
    // context.read<CounterBloc>().add(const CounterReset());
    context.read<CounterBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('Bloc Counter: ${counterBloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => resetCounter(context),
            icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: 
        context.select(
          (CounterBloc counterBloc) => Text(
            'Counter bloc \n ${counterBloc.state.counter}',
            style: const TextStyle(fontSize: 40),
            textAlign: TextAlign.center
          )
        )
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _botonAdd(context, 1),
          const SizedBox(height: 20,),
          _botonAdd(context, 2),
          const SizedBox(height: 20,),
          _botonAdd(context, 3),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _botonAdd (BuildContext context, int value) {
    FloatingActionButton buttom = FloatingActionButton(
      heroTag: '$value',
      child: Text('+$value'),
      onPressed: () => increaseCounterBy(context, value)
    );

    return buttom;
  }
}