import 'dart:core';

import 'package:flutter/material.dart';

import '../../view/onboarding/on_boarding_data.dart';
import '../styles/styles.dart';

// ignore: must_be_immutable
class BuildOnBoardingItem extends StatelessWidget {
  OnBoardingData onBoardingData;

  BuildOnBoardingItem({
    required this.onBoardingData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              //fit: BoxFit.fill,
              image: AssetImage(
                onBoardingData.image,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            onBoardingData.titleDecription,
            style: kTextStyleFont26,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            onBoardingData.subTitleDecription,
            style: kTextStyleFont22Bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
