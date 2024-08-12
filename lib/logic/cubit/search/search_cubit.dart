import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/home/search_model.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../shared/network/remote/end_points.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;

  void searchProduct(String? nameProduct) async {
    emit(SearchLoadingState());
    await DioHelper.postData(
      url: baseURL + SEARCH,
      token: token,
      data: {
        "nameProduct": nameProduct,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
