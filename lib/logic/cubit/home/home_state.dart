import 'package:shop_app/model/auth/login_model.dart';
import 'package:shop_app/model/home/products_model.dart';

import '../../../model/home/categories_model.dart';
import '../../../model/home/favorites_change_model.dart';
import '../../../model/home/product_details_model.dart';

abstract class HomeStates {}

// Home Products
class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  late ProductsModel? productsModel;

  HomeSuccessState(this.productsModel);
}

class HomeErrorState extends HomeStates {
  late String error;

  HomeErrorState(this.error);
}

class HomeChangeButtonNavState extends HomeStates {}

// Categories
class CategoriesSuccessState extends HomeStates {
  late CategoriesModel categoriesModel;

  CategoriesSuccessState(this.categoriesModel);
}

class CategoriesErrorState extends HomeStates {
  late String error;

  CategoriesErrorState(this.error);
}

//Change Favorites
class ChangeFavoritesSuccessState extends HomeStates {
  final FavoritesChangeModel? model;

  ChangeFavoritesSuccessState(this.model);
}

class ChangeSuccessState extends HomeStates {}

class ChangeFavoritesErrorState extends HomeStates {}

//Get Favorites
class GetFavoritesLoadingState extends HomeStates {}

class GetFavoritesSuccessState extends HomeStates {
  // late FavoritesModel favoritesModel;
  //
  // GetFavoritesSuccessState(this.favoritesModel);
}

class GetFavoritesErrorState extends HomeStates {}

//Product Details
class ProductLoadingDataState extends HomeStates {}

class ProductSuccessDataState extends HomeStates {
  ProductDetailsModel? productDetailsModel;

  ProductSuccessDataState(this.productDetailsModel);
}

class ProductErrorDataState extends HomeStates {}

// profile

class ProfileLoadingState extends HomeStates {}

class ProfileSuccessState extends HomeStates {
  LoginModel? profileModel;

  ProfileSuccessState(this.profileModel);
}

class ProfileErrorState extends HomeStates {
  late String error;

  ProfileErrorState(this.error);
}

// Update profile

class UpdateProfileLoadingState extends HomeStates {}

class UpdateProfileSuccessState extends HomeStates {
  // late ProfileModel profile;
  //
  // UpdateProfileSuccessState(this.profile);
}

class UpdateProfileErrorState extends HomeStates {
  late String error;

  UpdateProfileErrorState(this.error);
}
