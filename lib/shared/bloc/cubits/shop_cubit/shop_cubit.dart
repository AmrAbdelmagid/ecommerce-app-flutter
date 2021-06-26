import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommmerce_app/models/categories_model.dart';
import 'package:ecommmerce_app/models/home_model.dart';
import 'package:ecommmerce_app/screens/categories_screen.dart';
import 'package:ecommmerce_app/screens/favorites_screen.dart';
import 'package:ecommmerce_app/screens/products_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:ecommmerce_app/shared/helpers/dio_helper.dart';
import 'package:ecommmerce_app/shared/network/end_points.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
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

  HomeModel? homeModel;
  CategoriesModel? categoriesModel;

  void getHomeData(){
    DioHelper.getData(pathUrl: HOME,token: token).then((value) {

      homeModel = HomeModel.fromJson(value.data);
      log(homeModel!.data!.products[0].name.toString());
      emit(HomeDataSuccessState());

    }).catchError((error){
      log(error.toString());
      emit(HomeDataErrorState());
    });
  }

  void getCategoriesData(){
    DioHelper.getData(pathUrl: CATEGORIES).then((value) {

      categoriesModel = CategoriesModel.fromJson(value.data);
      log(categoriesModel!.data!.categoryDataModelList[0].name.toString());
      emit(CategoriesDataSuccessState());

    }).catchError((error){
      log(error.toString());
      emit(CategoriesDataErrorState());
    });
  }

}