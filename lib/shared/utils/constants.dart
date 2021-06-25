import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:flutter/material.dart';

const String APP_NAME = 'Shopy';

String? token;

void logout(BuildContext context) async {
  bool response = await CacheHelper.removeData(key: 'token');
  if (response) {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }
}
