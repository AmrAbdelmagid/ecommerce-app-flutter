import 'package:ecommmerce_app/models/login_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {

  RegisterSuccessState();
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterLoadingState extends RegisterStates {}

class RegisterPasswordVisibilityState extends RegisterStates {}
