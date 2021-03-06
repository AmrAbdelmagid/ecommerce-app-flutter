import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/layouts/shop_layout.dart';
import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/screens/on_boarding_screen.dart';
import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/screens/search_screen.dart';
import 'package:ecommmerce_app/screens/settings_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/login_cubit/login_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/register_cubit/register_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/helpers/bloc_observer_helper.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
import 'package:ecommmerce_app/shared/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.initCache();
  bool boardingShowed = CacheHelper.getData(key: 'OnBoarding') ?? false;
  token = CacheHelper.getData(key: 'token');
  Widget initialScreen;

  if (boardingShowed) {
    if (token != null) {
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
    ShopLayout();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategoriesData()
            ..getFavorites()
            ..getUserData(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp(
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
          ShopLayout.routeName: (context) => ShopLayout(),
        },
      ),
    );
  }
}
