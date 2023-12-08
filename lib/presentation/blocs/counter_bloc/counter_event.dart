part of 'counter_bloc.dart';

/// - Para emitir nuevos estados se hace `'basado en eventos'`
/// - Flutter bloc es un gestor de eventos mas controlado
/// - Define los tipos de eventos que va a recibir
abstract class CounterEvent {
  const CounterEvent();
}

/// [Este es el Evento] - Usualmente el nombre de la clase es el nombre del bloc y el verbo en pasado
class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}