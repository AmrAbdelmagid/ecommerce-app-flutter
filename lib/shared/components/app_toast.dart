import 'package:flutter/material.dart' show Color, Colors;
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  SUCCESS,
  ERROR,
  WARNING,
}

class AppToast {
  static Future<bool?> showToastMessage({
    required String message,
    required ToastType toastType,
  }) async {
    Color chooseColor(ToastType type) {
      Color color;
      switch (type) {
        case ToastType.SUCCESS:
          color = Colors.green;
          break;
        case ToastType.WARNING:
          color = Colors.amber;
          break;
        case ToastType.ERROR:
          color = Colors.red;
          break;
      }
      return color;
    }
    return await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseColor(toastType),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
