import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/screens/on_boarding_screen.dart';
import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/shared/helpers/helpers/bloc_observer_helper.dart';
import 'package:ecommmerce_app/shared/helpers/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/helpers/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/utils/themes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.initCache();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: OnBoardingScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
    );
  }
}
