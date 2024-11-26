import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    /// On Sign In Changed
    on<SignInOnChangedEvent>((event, emit) {
      if (event.emailValue == '' || validateEmail(event.emailValue) == false) {
        emit(SignInErrorState('Please enter a valid email address.'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Please enter a valid password.'));
      } else {
        emit(SignInValidateState());
      }
    });

    /// On Sign In Submit
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}

/// Validate Email
bool validateEmail(String email) {
  /// Regular expression for validating email addresses
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  return emailRegex.hasMatch(email);
}
