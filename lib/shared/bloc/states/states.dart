abstract class AppStates {}

// login states

class LoginInitialState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginLoadingState extends AppStates {}
