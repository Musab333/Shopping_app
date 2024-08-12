import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/constants/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';
import 'package:shop_app/shopping.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // bool onBoarding = CacheHelper.getData(key: 'onboarding');
  // print(onBoarding);

  token = CacheHelper.getData(key: 'token').toString();
  print('main token->$token');

  runApp(
    const ShoppingApp(
        //onBoarding: onBoarding,
        ),
  );
}
