
import 'package:ecommmerce_app/models/favorites_case_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class BottomNavBasState extends ShopStates {}

class HomeDataLoadingState extends ShopStates{}

class HomeDataSuccessState extends ShopStates{}

class HomeDataErrorState extends ShopStates{}

class CategoriesDataSuccessState extends ShopStates{}

class CategoriesDataErrorState extends ShopStates{}

class FavoritesProductsChangeState extends ShopStates{}

class FavoritesProductsSuccessState extends ShopStates{
  FavoritesCaseModel? favoritesCaseModel;
  FavoritesProductsSuccessState(this.favoritesCaseModel);
}

class FavoritesProductsErrorState extends ShopStates{}

class GettingFavoritesProductsSuccessState extends ShopStates{}

class GettingFavoritesProductsLoadingState extends ShopStates{}

class GettingFavoritesProductsErrorState extends ShopStates{}

class UpdateUserDataSuccessState extends ShopStates{}

class UpdateUserDataLoadingState extends ShopStates{}

class UpdateUserDataErrorState extends ShopStates{}