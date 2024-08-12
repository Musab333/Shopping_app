import 'package:flutter/material.dart';

import '../styles/colors.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({
    super.key,
    required this.text,
    required this.function,
    required this.fontSize,
  });

  final String text;
  final double fontSize;
  void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.defaultColors,
          fontFamily: 'Jannah',
        ),
      ),
    );
  }
}
