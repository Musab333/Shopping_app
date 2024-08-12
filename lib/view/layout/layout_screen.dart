import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/constants/route_navigator.dart';

import '../../logic/cubit/home/home_cubit.dart';
import '../../logic/cubit/home/home_state.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';
import '../home/search/search_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Shopping',
              style: kTextStyleFont22Blue,
            ),
            actions: [
              IconButton(
                color: AppColors.defaultColors,
                onPressed: () {
                  RouteNavigator.navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                color: AppColors.defaultColors,
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.defaultColors,
                ),
              ),
            ],
          ),
          body: cubit.buttonScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeButton(index);
            },
            currentIndex: cubit.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Castigators',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
