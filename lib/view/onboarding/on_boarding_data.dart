class OnBoardingData {
  final String image;
  final String titleDecription;
  final String subTitleDecription;

  OnBoardingData({
    required this.image,
    required this.titleDecription,
    required this.subTitleDecription,
  });
}

List<OnBoardingData> onBoardingDataList = [
  OnBoardingData(
    image: "assets/images/onboard_1.png",
    titleDecription: 'تمتع بالتسوق',
    subTitleDecription:
        'يمكنك الان التسوق عبر التطبيق وشراء كل احتياجاتك اليومية',
  ),
  OnBoardingData(
    image: "assets/images/onboard_2.png",
    titleDecription: 'اضافة المنتج الي السلة',
    subTitleDecription:
        'يمكنك اضافة المنتج الي السلة المشتريات واتمام عملية الشراء الي يوم اخر',
  ),
  OnBoardingData(
    image: "assets/images/onboard_3.png",
    titleDecription: 'التوصيل السريع',
    subTitleDecription:
        'تمتع بخدمة التوصيل السريع من داخل التطبيق والتسليم خلال دقائق',
  ),
];
