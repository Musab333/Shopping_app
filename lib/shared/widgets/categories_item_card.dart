import 'package:flutter/material.dart';

import '../../model/home/categories_model.dart';

Widget CategoriesItemCard(DataModel model) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(
            model.image,
          ),
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(
          model.name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
