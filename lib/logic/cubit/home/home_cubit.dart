import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/home/products_model.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../model/auth/login_model.dart';
import '../../../model/home/categories_model.dart';
import '../../../model/home/favorites_change_model.dart';
import '../../../model/home/favorites_model.dart';
import '../../../model/home/product_details_model.dart';
import '../../../shared/network/remote/end_points.dart';
import '../../../view/home/castigators/cateogries_screen.dart';
import '../../../view/home/favorites/favorites_screen.dart';
import '../../../view/home/products/products_screen.dart';
import '../../../view/home/settings/setting_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> buttonScreens = [
    const ProductsScreen(),
    const CateogriesScreen(),
    const FavoritesScreen(),
    const SettingScreen(),
  ];

  void changeButton(int index) {
    currentIndex = index;
    emit(HomeChangeButtonNavState());
  }

  //Get Products Data in Home
  ProductsModel? productModel;

  Map<int, bool?> favorites = {};
  Map<int, bool?> cart = {};
  void getProductsData() async {
    emit(HomeLoadingState());
    await DioHelper.getData(
      url: baseURL + HOME,
      token: token,
    ).then((value) {
      productModel = ProductsModel.fromJson(value.data);
      for (var element in productModel!.data!.products) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
        cart.addAll({element.id: element.inCart});
        emit(HomeLoadingState());
      }
      print(favorites.toString());
      emit(HomeSuccessState(productModel));
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState(error.toString()));
    });
  }

  //Get Categories Data
  CategoriesModel? categoriesModel;

  void getCategoriesData() async {
    await DioHelper.getData(
      url: baseURL + GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategoriesSuccessState(categoriesModel!));
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error.toString()));
    });
  }

  //Change State Favorites
  FavoritesChangeModel? favoritesChangeModel;
  void changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeSuccessState());
    await DioHelper.postData(
      url: baseURL + FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      favoritesChangeModel = FavoritesChangeModel.fromJson(value.data);
      if (favoritesChangeModel?.state == false) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
        emit(GetFavoritesLoadingState());
      }
      print(value.data);
      emit(ChangeFavoritesSuccessState(favoritesChangeModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ChangeFavoritesErrorState());
    });
  }

  // Get Favorites
  FavoritesModel? favoritesModel;
  void getFavoritesData() async {
    emit(GetFavoritesLoadingState());
    await DioHelper.getData(
      url: baseURL + FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(value.data.toString());
      emit(GetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesErrorState());
    });
  }

  // Product Details
  ProductDetailsModel? productDetailsModel;
  void getProductDetailsData(int? id) async {
    if (id == null) return;
    emit(ProductLoadingDataState());
    await DioHelper.getData(
      url: baseURL + PRODUCTS + '$id',
      token: token,
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(ProductSuccessDataState(productDetailsModel));
    }).catchError((error) {
      print('error in product details is: ');
      print(error.toString());
      emit(ProductErrorDataState());
    });
  }

  // Get Profile User Data
  LoginModel? profileModel;

  void getProfileData() async {
    emit(ProfileLoadingState());
    await DioHelper.getData(
      url: baseURL + PROFILE,
      token: token,
    ).then((value) {
      profileModel = LoginModel.fromJson(value.data);
      print(profileModel!.status);
      print(profileModel!.data!.name);
      emit(ProfileSuccessState(profileModel));
    }).catchError((error) {
      print('error in get use is: ');
      print(error.toString());
      emit(ProfileErrorState(error.toString()));
    });
  }

  // Update Profile User
  void updateProfileData({
    required String? name,
    required String? email,
    required String? phone,
  }) async {
    emit(UpdateProfileLoadingState());
    await DioHelper.putData(
      url: baseURL + UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      profileModel = LoginModel.fromJson(value.data);
      print(profileModel!.status);
      print(profileModel!.data!.name);
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      print('error in update profile is: ');
      print(error.toString());
      emit(UpdateProfileErrorState(error.toString()));
    });
  }
}
