import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/layouts/shop_layout.dart';
import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/screens/on_boarding_screen.dart';
import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/screens/search_screen.dart';
import 'package:ecommmerce_app/screens/settings_screen.dart';
import 'package:ecommmerce_app/shared/helpers/bloc_observer_helper.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/utils/themes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.initCache();
  bool boardingShowed = CacheHelper.getData(key: 'OnBoarding') ?? false;
  String? token = CacheHelper.getData(key: 'token');
  Widget initialScreen;

  if (boardingShowed)
    {
      if (token != null){
        initialScreen = ShopLayout();
      } else {
        initialScreen = LoginScreen();
      }
    } else {
    initialScreen = OnBoardingScreen();
  }

  runApp(MyApp(initialScreen));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget initialWidget;
  MyApp(this.initialWidget);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: initialWidget,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
    );
  }
}
