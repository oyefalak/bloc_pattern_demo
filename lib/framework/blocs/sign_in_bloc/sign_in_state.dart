abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInValidateState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMsg;

  SignInErrorState(this.errorMsg);
}

class SignInLoadingState extends SignInState {}

class SignInSubmitState extends SignInState {}
