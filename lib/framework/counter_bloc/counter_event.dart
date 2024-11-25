part of 'counter_bloc.dart';

/// Counter Events
abstract class CounterEvent {}

class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}
