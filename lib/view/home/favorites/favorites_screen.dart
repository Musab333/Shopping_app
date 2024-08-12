import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/cubit/home/home_cubit.dart';
import '../../../logic/cubit/home/home_state.dart';
import '../../../shared/widgets/favorite_item_card_widget.dart';
import '../../../shared/widgets/toast_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetFavoritesSuccessState) {
          if (state == false) {
            toastMessageWidget(
                message: 'حدث خطأ في تحميل البيانات', state: ToastState.ERROR);
          }
        }
      },
      builder: (context, state) {
        print('---> $state');
        return ConditionalBuilder(
          condition: state is! GetFavoritesLoadingState,
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => favoriteItemCardWidget(
                HomeCubit.get(context).favoritesModel!.data!.data![index],
                context,
              ),
              separatorBuilder: (context, index) => const Divider(height: 2.0),
              itemCount:
                  HomeCubit.get(context).favoritesModel!.data!.data!.length,
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
