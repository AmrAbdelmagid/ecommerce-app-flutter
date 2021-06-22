import 'package:ecommmerce_app/shared/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: Container(),
    );
  }
}
