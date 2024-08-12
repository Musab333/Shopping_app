import 'package:flutter/material.dart';

import '../../logic/cubit/home/home_cubit.dart';
import '../styles/colors.dart';

Widget searchItemCardWidget(model, context, {bool isOldPrice = true}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image(
                image: NetworkImage(model.image),
                height: 120.0,
                width: 120.0,
              ),
              if (model.discount != 0 && isOldPrice)
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
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  maxLines: 2,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      model.price.round().toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.defaultColors,
                        //height: 1.3,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    if (model.discount != 0 && isOldPrice)
                      Text(
                        model.product!.oldPrice.round().toString(),
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
                        HomeCubit.get(context).changeFavorites(model.id);
                      },
                      //color: AppColors.defaultColors,
                      icon: CircleAvatar(
                        backgroundColor:
                            HomeCubit.get(context).favorites[model.id]!
                                ? Colors.red
                                : AppColors.defaultColors,
                        radius: 15,
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
