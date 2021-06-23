import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/screens/categories_screen.dart';
import 'package:ecommmerce_app/screens/favorites_screen.dart';
import 'package:ecommmerce_app/screens/products_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  int currentIndex = 0;

  void toggleBottomScreens(int index){
    currentIndex = index;
    emit(BottomNavBasState());
  }

}