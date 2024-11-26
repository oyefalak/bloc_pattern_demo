import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_pattern_demo/ui/routes/routes.dart';
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
      create: (_) => SignInBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sign In',
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: '/signIn',
      ),
    );
  }
}
