import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

/// Counter Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterIncremented>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<CounterDecremented>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
