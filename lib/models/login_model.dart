import 'package:ecommmerce_app/models/user_data_model.dart';

class LoginModel{
  bool? status;
  String? message;
  UserDataModel? userDataModel;
  static LoginModel? authModel;
  LoginModel.fromJson(Map<String,dynamic> jsonData){
    status = jsonData['status'];
    message = jsonData['message'];
    userDataModel = jsonData['data'] != null ? UserDataModel.fromJson(jsonData['data']) : null;
  }
}