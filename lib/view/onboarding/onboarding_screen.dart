import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constants/route_navigator.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/network/local/cache_helper.dart';
import '../../shared/widgets/build_onboarding_item.dart';
import '../../shared/widgets/text_button_widget.dart';
import '../auth/login/login_screen.dart';
import 'on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoardingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButtonWidget(
            text: 'SKIP',
            fontSize: 16,
            function: () {
              RouteNavigator.navigateAndFinish(context, const LoginScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardingController,
                onPageChanged: (int index) {
                  if (index == onBoardingDataList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildOnBoardingItem(
                    onBoardingData: onBoardingDataList[index]),
                itemCount: onBoardingDataList.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: onBoardingController,
                  count: onBoardingDataList.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: AppColors.defaultColors,
                    dotHeight: 15,
                    dotWidth: 20,
                    expansionFactor: 2,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      RouteNavigator.navigateAndFinish(
                          context, const LoginScreen());
                    } else {
                      onBoardingController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    CacheHelper.saveData(key: 'onboarding', value: true).then((value) => {
          if (value)
            {RouteNavigator.navigateAndFinish(context, const LoginScreen())}
        });
  }
}
