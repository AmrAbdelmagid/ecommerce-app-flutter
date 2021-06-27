import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/models/login_model.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/register_cubit/register_states.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = false;


  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    emit(RegisterPasswordVisibilityState());
  }

  void register({required String email, required String password, required String name,required String phone}) {
    emit(RegisterLoadingState());
    DioHelper.postData(pathUrl: REGISTER, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    }).then((result) {
      LoginModel.authModel = LoginModel.fromJson(result.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      log(error.toString());
    });
  }
}
