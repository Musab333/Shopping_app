import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:shop_app/view/layout/layout_screen.dart';
import 'package:shop_app/view/onboarding/onboarding_screen.dart';

import 'logic/cubit/home/home_cubit.dart';
import 'logic/cubit/home/home_state.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  //required this.onBoarding
  //final bool onBoarding;
  //Widget widgetScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getProductsData()
        ..getCategoriesData()
        ..getFavoritesData()
        ..getProfileData(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shopping App',
            theme: lightTheme,
            //darkTheme: darkTheme,
            //themeMode: lightTheme,
            //home: onBoarding ? const LoginScreen() : const OnBoardingScreen(),
            home: const OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
