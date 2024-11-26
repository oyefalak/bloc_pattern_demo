abstract class SignInEvents {}

class SignInOnChangedEvent extends SignInEvents {
  final String emailValue;
  final String passwordValue;

  SignInOnChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvents {
  final String email;
  final String password;

  SignInSubmittedEvent(this.email, this.password);
}
