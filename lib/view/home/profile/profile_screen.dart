import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/shared/widgets/material_button_widget.dart';
import '../../../logic/cubit/home/home_cubit.dart';
import '../../../logic/cubit/home/home_state.dart';
import '../../../shared/widgets/text_form_field_widget.dart';
import '../../../shared/styles/styles.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, HomeStates state) {
        if (state is ProfileSuccessState) {
          usernameController.text = state.profileModel!.data!.name;
          emailController.text = state.profileModel!.data!.email;
          phoneController.text = state.profileModel!.data!.phone;
        }
        // if (state is ProfileSuccessState) {
        //   if (state.profile.status == false) {
        //     toastMessageWidget(
        //       message: 'حدث خطأ في تحميل البيانات',
        //       state: ToastState.ERROR,
        //     );
        //   }
        // }
        // if (state is UpdateProfileSuccessState) {
        //   if (state == true) {
        //     toastMessageWidget(
        //       message: 'تما تحدبث البيانات بنجاح',
        //       state: ToastState.ERROR,
        //     );
        //   } else {
        //     toastMessageWidget(
        //       message:
        //           "حدث خطأ في تحديث البيانات الرجاء \n اعادة المحاولة مرة آخر",
        //       state: ToastState.ERROR,
        //     );
        //   }
        // }
      },
      builder: (context, state) {
        var profileDate = HomeCubit.get(context).profileModel!;

        usernameController.text = profileDate.data!.name;
        emailController.text = profileDate.data!.email;
        phoneController.text = profileDate.data!.phone;

        return ConditionalBuilder(
          //state is! ProfileLoadingState,
          //HomeCubit.get(context).profileModel != null,
          condition: HomeCubit.get(context).profileModel != null,
          builder: (context) {
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: profileUserWidget(context, state),
                ),
              ),
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget profileUserWidget(context, state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            if (state is UpdateProfileLoadingState)
              const LinearProgressIndicator(),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Expanded(
                child: SvgPicture.asset(
                  'assets/images/profile.svg',
                ),
              ),
            ),
            Text(
              'Profile',
              style: kTextStyleFont40Blue,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormFieldWidget(
              textController: usernameController,
              text: 'Username',
              keyPadType: TextInputType.text,
              isPassword: false,
              prefixIcon: const Icon(Icons.person),
              validate: (value) {
                if (value!.isEmpty) return 'Enter your username';
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              textController: emailController,
              text: 'Email',
              keyPadType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email),
              isPassword: false,
              validate: (value) {
                return 'Enter your Email address';
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              textController: phoneController,
              text: 'Phone',
              keyPadType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone),
              isPassword: false,
              validate: (value) {
                return 'Enter Phone number';
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButtonWidget(
                text: 'Update',
                icon: Icons.update_outlined,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    HomeCubit.get(context).updateProfileData(
                        name: usernameController.text,
                        email: emailController.text,
                        phone: phoneController.text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
