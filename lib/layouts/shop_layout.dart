import 'package:ecommmerce_app/screens/search_screen.dart';
import 'package:ecommmerce_app/screens/settings_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  static const routeName = '/shop';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavorites(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(APP_NAME,style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(
                  color: Colors.black,
                  fontFamily: 'Blueberry Sans',
                  fontWeight: FontWeight.w600),),
              actions: [
                IconButton(onPressed: (){
                  Navigator.of(context).pushNamed(SearchScreen.routeName);
                }, icon: Icon(Icons.search,color: Colors.black,)),
                IconButton(onPressed: (){
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                }, icon: Icon(Icons.settings,color: Colors.black,)),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.toggleBottomScreens(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
              ],
            ),
          );
        },
      ),
    );
  }
}
