import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit counterCubit) {
          return Text('Cubit Counter Transactions: ${counterCubit.state.transactionCount}');// muestra la cantidad de transacciones
        },),

        actions: [
          IconButton(
            onPressed: () => context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,// cambia el estado solo si cambia el counter
          builder: (context, state) {
            print('>> Counter cambio');
            return Text('Counter value \n${state.counter}', style: const TextStyle(fontSize: 40), textAlign: TextAlign.center,);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          increaseByFloatingActionButtons(1, context),
          const SizedBox(height: 20),
          increaseByFloatingActionButtons(2, context),
          const SizedBox(height: 20),
          increaseByFloatingActionButtons(3, context),
        ],
      ),
    );
  }

  Widget increaseByFloatingActionButtons(int cantidad, BuildContext context) {
    return FloatingActionButton(
      heroTag: '$cantidad',
      child: Text('+$cantidad'),
      onPressed: () => context.read<CounterCubit>().increaseBy(cantidad)
    );
  }
}
