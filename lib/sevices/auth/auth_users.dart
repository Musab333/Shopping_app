import 'package:flutter/cupertino.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';
import '../../logic/cubit/auth/login/login_cubit.dart';
import '../../shared/components/constants/route_navigator.dart';
import '../../view/auth/login/login_screen.dart';

class AuthenticationUsers {
  static var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static void loginCheck(context, emailController, passwordController) {
    if (formKey.currentState!.validate()) {
      LoginCubit.get(context).userLogin(
          email: emailController.text, password: passwordController.text);
    }
  }

  static dynamic logout(context) {
    CacheHelper.removeData(key: token!).then(
      (value) {
        if (value) {
          RouteNavigator.navigateAndFinish(context, const LoginScreen());
        }
      },
    );
  }

  void registerCheck(context) {
    if (formKey.currentState!.validate()) {
      LoginCubit.get(context).userLogin(
          email: emailController.text, password: passwordController.text);
    }
  }
}
