import 'package:flutter/material.dart';

class RouteNavigator {
  static void navigateTo(context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void navigateAndFinish(context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  void navigateBack(context) {
    Navigator.pop(context);
  }
}
