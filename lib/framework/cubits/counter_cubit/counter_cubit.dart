import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

/// Counter Cubit
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0));

  /// Method to increment the counter
  void increment() {
    emit(CounterState(counter: state.counter + 1));
  }

  /// Method to decrement the counter
  void decrement() {
    emit(CounterState(counter: state.counter - 1));
  }
}
