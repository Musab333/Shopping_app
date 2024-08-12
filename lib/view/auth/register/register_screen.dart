import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/shared/components/constants/route_navigator.dart';
import '../../../logic/cubit/auth/register/register_cubit.dart';
import '../../../shared/widgets/material_button_widget.dart';
import '../../../shared/widgets/text_button_widget.dart';
import '../../../shared/widgets/text_form_field_widget.dart';
import '../../../shared/widgets/toast_widget.dart';
import '../../../shared/styles/styles.dart';
import '../../layout/layout_screen.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext Context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel!.status == true) {
              // print(state.loginModel!.status);
              // print(state.loginModel!.message);
              // print(state.loginModel!.data!.token);
              RouteNavigator.navigateAndFinish(context, const LayoutScreen());
              return toastMessageWidget(
                message: state.loginModel!.message!,
                state: ToastState.SUCCESS,
              );

              // CacheHelper.saveData(
              //     key: 'token', value: state.loginModel!.status)
              //     .then(
              //       (value) {
              //     token = state.loginModel!.data!.token;
              //     RouteNavigator.navigateAndFinish(
              //         context, const LayoutScreen());
              //   },
              // );
            } else {
              print(state.loginModel!.message);
              return toastMessageWidget(
                message: state.loginModel!.message!,
                state: ToastState.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
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
                                'assets/images/register.svg',
                                height: 300,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'REGISTER',
                            style: kTextStyleFont40Blue,
                          ),
                          Text(
                            'Welcome in Register new in App',
                            style: kTextStyleFont20Blue,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            text: 'Username',
                            textController: usernameController,
                            keyPadType: TextInputType.text,
                            isPassword: false,
                            prefixIcon: const Icon(Icons.person),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your the email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            text: 'Email',
                            textController: emailController,
                            keyPadType: TextInputType.emailAddress,
                            isPassword: false,
                            prefixIcon: const Icon(Icons.email_outlined),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your the email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            text: 'Password',
                            textController: passwordController,
                            keyPadType: TextInputType.visiblePassword,
                            prefixIcon: const Icon(Icons.lock),
                            isPassword: RegisterCubit.get(context).isPassword,
                            suffixIcon: RegisterCubit.get(context).suffix,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            enabled: true,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your the email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormFieldWidget(
                            text: 'Phone',
                            textController: phoneController,
                            keyPadType: TextInputType.phone,
                            prefixIcon:
                                const Icon(Icons.phone_android_outlined),
                            enabled: true,
                            isPassword: false,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your the email address';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => MaterialButtonWidget(
                                text: 'REGISTER',
                                icon: Icons.check_circle,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    RegisterCubit.get(context).registerUser(
                                      name: usernameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Go to ',
                                style: kTextStyleFont18GreyBold,
                              ),
                              TextButtonWidget(
                                //Register
                                text: 'LOGIN',
                                fontSize: 18,
                                function: () {
                                  RouteNavigator.navigateAndFinish(
                                      context, const LoginScreen());
                                  //(route) => false);
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
