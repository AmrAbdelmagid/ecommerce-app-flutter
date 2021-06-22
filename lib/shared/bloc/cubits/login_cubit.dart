import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/shared/bloc/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);



}