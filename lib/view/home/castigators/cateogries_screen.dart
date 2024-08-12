import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home/home_cubit.dart';
import '../../../logic/cubit/home/home_state.dart';
import '../../../shared/widgets/categories_item_card.dart';
import '../../../shared/widgets/toast_widget.dart';

class CateogriesScreen extends StatelessWidget {
  const CateogriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, HomeStates state) {
        if (state is CategoriesSuccessState) {
          if (state.categoriesModel.status == false) {
            toastMessageWidget(
                message: 'حدث خطأ في تحميل البيانات', state: ToastState.ERROR);
          }
        }
      },
      builder: (context, HomeStates state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CategoriesItemCard(
              HomeCubit.get(context).categoriesModel!.data!.data[index]),
          separatorBuilder: (context, index) => const Divider(height: 2.0),
          itemCount: HomeCubit.get(context).categoriesModel!.data!.data.length,
        );
      },
    );
  }
}
