import 'package:flutter/material.dart';

import '../../model/home/categories_model.dart';

Widget categoriesItemWidget(DataModel model) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image),
        width: 200,
        height: 150,
        //fit: BoxFit.contain,
      ),
      Container(
        color: Colors.black.withOpacity(.6),
        width: 200.0,
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
