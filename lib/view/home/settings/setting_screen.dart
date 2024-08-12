import 'package:flutter/material.dart';

import '../../../sevices/auth/auth_users.dart';
import '../../../shared/components/constants/route_navigator.dart';
import '../../../shared/styles/colors.dart';
import '../profile/profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                itemSettings(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () {
                    RouteNavigator.navigateTo(
                      context,
                      ProfileScreen(),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                itemSettings(
                    title: 'Language', icon: Icons.language, onTap: () {}),
                const SizedBox(
                  height: 20.0,
                ),
                // itemSettings(title: 'Test', icon: Icons.language, onTap: () {}),
                // const SizedBox(
                //   height: 20.0,
                // ),
                const SizedBox(
                  height: 200.0,
                ),

                itemSettings(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    //showDialogCustom(context);
                    RouteNavigator.navigateTo(
                      context,
                      AuthenticationUsers.logout(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget itemSettings({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: AppColors.defaultColors,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Icon(
              icon,
              color: AppColors.secondColors,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
