import 'package:ecommmerce_app/models/login_model.dart';

abstract class AppStates {}

// login states

class LoginInitialState extends AppStates {}

class LoginSuccessState extends AppStates {
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AppStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginLoadingState extends AppStates {}

class LoginPasswordVisibilityState extends AppStates {}
