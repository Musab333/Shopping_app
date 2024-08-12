import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  accentColor: AppColors.defaultColors,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.defaultColors,
  ),
  primaryIconTheme: const IconThemeData(
    color: AppColors.defaultColors,
  ),
  //primaryColor: AppColors.defaultColors,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.defaultColors,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.defaultColors,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData darkTheme = ThemeData(
  accentColor: AppColors.defaultColors,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    //   iconTheme: IconThemeData(
    //     color: Colors.white,
    //   ),
    // ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   type: BottomNavigationBarType.fixed,
    //   selectedItemColor: defaultColor,
    //   unselectedItemColor: Colors.grey,
    //   elevation: 20.0,
    //   backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);
