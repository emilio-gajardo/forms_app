import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// - Es el manejador del estado
/// - [state] es global dentro de toda la clase CounterBloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {

  /// Constructor del bloc
  CounterBloc() : super(const CounterState()) {

    /// Handler = manejador de evento
    // on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit));// esta opción es otra forma de llamar a la función
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
      /// Emision del nuevo evento
      emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }

  void increasedBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(const CounterReset());
  }
}
