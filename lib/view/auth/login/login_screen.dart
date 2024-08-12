import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';
import '../../../logic/cubit/auth/login/login_cubit.dart';
import '../../../shared/components/constants/route_navigator.dart';
import '../../../shared/widgets/material_button_widget.dart';
import '../../../shared/widgets/text_button_widget.dart';
import '../../../shared/widgets/text_form_field_widget.dart';
import '../../../shared/widgets/toast_widget.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/styles/styles.dart';
import '../../layout/layout_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.status == true) {
              //--> Save user token <---
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel!.status)
                  .then(
                (value) {
                  token = state.loginModel!.data!.token;
                  RouteNavigator.navigateAndFinish(
                      context, const LayoutScreen());
                },
              );
              print('token login->$token');

              return toastMessageWidget(
                message: state.loginModel!.message!,
                state: ToastState.SUCCESS,
              );
            } else {
              print(state.loginModel!.message);
              return toastMessageWidget(
                message: state.loginModel!.message!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (BuildContext context, LoginStates state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Expanded(
                              child: SvgPicture.asset(
                                'assets/images/login.svg',
                                height: 300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'LOGIN',
                            style: kTextStyleFont40Blue,
                          ),
                          Text(
                            'Login new to browse our hot offers',
                            style: kTextStyleFont20Blue,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormFieldWidget(
                            text: 'Email',
                            textController: emailController,
                            keyPadType: TextInputType.emailAddress,
                            isPassword: false,
                            prefixIcon: const Icon(Icons.email),
                            validate: (value) {
                              if (value!.isEmpty)
                                return 'Enter your the email address';
                              return null;
                            },
                            onChanged: (x) {},
                            onSubmit: (x) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            text: 'Password',
                            textController: passwordController,
                            keyPadType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.lock),
                            isPassword: LoginCubit.get(context).isPassword,
                            suffixIcon: LoginCubit.get(context).suffix,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            enabled: true,
                            validate: (value) {
                              if (value!.isEmpty) return 'Password is to short';
                              return null;
                            },
                            // onFieldSubmitted: () {},
                            // onChanged: () {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (context) => MaterialButtonWidget(
                                text: 'LOGIN',
                                icon: Icons.check_circle,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                              fallback: (context) => const Center(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: kTextStyleFont18Black,
                              ),
                              TextButtonWidget(
                                //Register
                                text: 'REGISTER',
                                fontSize: 18,
                                function: () {
                                  RouteNavigator.navigateAndFinish(
                                      context, const RegisterScreen());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
