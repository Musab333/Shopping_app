import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class MaterialButtonWidget extends StatelessWidget {
  MaterialButtonWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final Function()? onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        //elevation: 15,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: AppColors.defaultColors,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: kTextStyleFont18BoldWhite,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
