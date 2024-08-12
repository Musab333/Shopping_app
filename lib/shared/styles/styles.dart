import 'package:flutter/material.dart';

import 'colors.dart';

class MediaQueryApp {
  static double h = MediaQuery.of(BuildContext as BuildContext).size.height;
  static double w = MediaQuery.of(BuildContext as BuildContext).size.width;
}

var kTextStyleFont26 = const TextStyle(
  fontSize: 26,
);

var kTextStyleFont24 = const TextStyle(
  fontSize: 24,
);

var kTextStyleFont24W800 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w800,
);

var kTextStyleFont22 = const TextStyle(
  fontSize: 22,
);

var kTextStyleFont22Bold = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

var kTextStyleFont20 = const TextStyle(
  fontSize: 20,
);

var kTextStyleFont18 = const TextStyle(
  fontSize: 18,
);

var kTextStyleFont18Black = const TextStyle(
  fontSize: 18,
  color: Colors.black,
);

var kTextStyleFont18GreyBold = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);

var kTextStyleFont16 = const TextStyle(
  fontSize: 16,
);

var kTextStyleFont16Bold = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

var kTextStyleFont18BoldWhite = const TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var kTextStyleFont40Blue = const TextStyle(
  fontSize: 40,
  color: AppColors.defaultColors,
);

var kTextStyleFont20Blue = const TextStyle(
  fontSize: 20,
  color: AppColors.defaultColors,
);

var kTextStyleFont22Blue = const TextStyle(
  fontSize: 22,
  color: AppColors.defaultColors,
);
