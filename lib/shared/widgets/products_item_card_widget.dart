import 'package:flutter/material.dart';
import '../../logic/cubit/home/home_cubit.dart';
import '../../view/home/products/product_details_screen.dart';
import '../styles/colors.dart';
import '../components/constants/route_navigator.dart';

Widget productsItemCardWidget(model, int index, context) {
  var choose = HomeCubit.get(context).favorites[model.data!.products[index].id];

  return InkWell(
    onTap: () {
      RouteNavigator.navigateTo(
        context,
        ProductDetailsScreen(productId: model.data!.products[index].id),
      );
    },
    child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image(
                image: NetworkImage(model.data!.products[index].image),
                height: 200.0,
                width: double.infinity,
              ),
              if (model.data!.products[index].discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.data!.products[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.data!.products[index].price.round()}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.defaultColors,
                        //height: 1.3,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (model.data!.products[index].discount != 0)
                      Text(
                        '${model.data!.products[index].oldPrice.round()}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          //height: 1.3,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context)
                            .changeFavorites(model.data!.products[index].id);
                      },
                      color: AppColors.defaultColors,
                      icon: CircleAvatar(
                        backgroundColor:
                            choose! ? Colors.red : AppColors.defaultColors,
                        radius: 14,
                        child: const Icon(
                          color: Colors.white,
                          Icons.favorite_border,
                          //size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
