import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../../logic/cubit/home/home_cubit.dart';
import '../../../logic/cubit/home/home_state.dart';
import '../../../model/home/categories_model.dart';
import '../../../model/home/products_model.dart';
import '../../../shared/styles/styles.dart';
import '../../../shared/widgets/categoriesItemWidget.dart';
import '../../../shared/widgets/products_item_card_widget.dart';
import '../../../shared/widgets/toast_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, HomeStates state) {
        // if (state is HomeSuccessState) {
        //   if (state.productsModel!.status == false) {
        //     toastMessageWidget(
        //         message: 'حدث خطأ في تحميل البيانات', state: ToastState.ERROR);
        //   } else {
        //     toastMessageWidget(
        //         message: 'مرحبآ في Shopping', state: ToastState.SUCCESS);
        //   }
        // }
        if (state is ChangeFavoritesSuccessState) {
          if (state.model!.state == false) {
            toastMessageWidget(
                message: state.model!.message.toString(),
                state: ToastState.ERROR);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).productModel != null &&
              HomeCubit.get(context).categoriesModel != null,
          builder: (context) => productWidget(
            HomeCubit.get(context).productModel!,
            HomeCubit.get(context).categoriesModel!,
            context,
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
            color: AppColors.defaultColors,
          )),
        );
      },
    );
  }

  Widget productWidget(
      ProductsModel model, CategoriesModel categoriesModel, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CarouselSlider(
                items: model.data!.banners.map(
                  (e) {
                    return Image(
                      image: NetworkImage(e.image),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: kTextStyleFont24W800,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        categoriesItemWidget(categoriesModel.data!.data[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20.0,
                    ),
                    itemCount: categoriesModel.data!.data.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'New Products',
                  style: kTextStyleFont24W800,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1 / 1.60,
              children: List.generate(
                model.data!.products.length,
                (index) => productsItemCardWidget(model, index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
