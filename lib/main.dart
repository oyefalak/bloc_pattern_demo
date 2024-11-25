import 'package:bloc_pattern_demo/framework/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_pattern_demo/framework/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_demo/ui/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App with Cubit',
        home: CounterPage(),
      ),
    );
  }
}
