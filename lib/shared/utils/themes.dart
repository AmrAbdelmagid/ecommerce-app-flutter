import 'package:ecommmerce_app/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var darkTheme = ThemeData(appBarTheme: AppBarTheme(color: Colors.black26));
var lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
    primaryColor: whiteColor,
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      backgroundColor: whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: whiteColor,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0.0,
    ));
