import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/models/login_model.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/login_cubit/login_states.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = false;



  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(LoginPasswordVisibilityState());
  }

  void login({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(pathUrl: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((result) {
      LoginModel.authModel = LoginModel.fromJson(result.data);
      emit(LoginSuccessState(LoginModel.authModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      log(error.toString());
    });
  }
}
