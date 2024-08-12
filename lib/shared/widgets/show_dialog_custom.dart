import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view/auth/login/login_screen.dart';
import '../components/constants/route_navigator.dart';
import '../styles/colors.dart';

Future<String?> showDialogCustom(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: AppColors.secondColors,
        //shadowColor: thirdColor,
        icon: const Icon(
          Icons.logout,
          color: AppColors.defaultColors,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'تسجيل الخروج',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        content: const Text(
          'هل تريد حقا الخروج من التطبيق ؟',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              RouteNavigator.navigateAndFinish(
                context,
                const LoginScreen(),
              );
            },
            child: const Text(
              'خروج',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0.w,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'الغاء');
            },
            child: const Text(
              'الغاء',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
