import 'package:bloc_pattern_demo/framework/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_pattern_demo/framework/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_demo/ui/counter_page/counter_page.dart';
import 'package:bloc_pattern_demo/ui/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/signIn":
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (BuildContext context) => SignInBloc(),
            child: SignInPage(),
          ),
        );
      case "/counter":
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (BuildContext context) => CounterCubit(),
            child: const CounterPage(),
          ),
        );
      default:
        return null;
    }
  }
}
