import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/cubit/home/home_cubit.dart';
import '../../../logic/cubit/home/home_state.dart';
import '../../../model/home/product_details_model.dart';
import '../../../shared/widgets/toast_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({
    required this.productId,
    Key? key,
  }) : super(key: key);
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  CarouselController carouselController = CarouselController();

  int activeIndex = 0;

  @override
  void initState() {
    HomeCubit.get(context).getProductDetailsData(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is ProductSuccessDataState) {
          if (state.productDetailsModel!.status == false) {
            toastMessageWidget(
              message: 'حدث خطأ في تحميل البيانات',
              state: ToastState.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        print(HomeCubit.get(context).productDetailsModel);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            //HomeCubit.get(context).productDetailsModel != null
            condition: HomeCubit.get(context).productDetailsModel != null,
            builder: (context) => productDetailsWidget(
              HomeCubit.get(context).productDetailsModel!,
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget productDetailsWidget(ProductDetailsModel model) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CarouselSlider(
                items: model.data!.images!.map(
                  (e) {
                    return Image(
                      image: NetworkImage(e.image.toString()),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                      carouselController.jumpToPage(index);
                    });
                  },
                  height: 250,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 10,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Text(
          //         'Categories',
          //         style: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.w800,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Container(
          //         height: 100.0,
          //         child: ListView.separated(
          //           scrollDirection: Axis.horizontal,
          //           physics: const BouncingScrollPhysics(),
          //           itemBuilder: (context, index) =>
          //               categoriesItemWidget(categoriesModel.data!.data[index]),
          //           separatorBuilder: (context, index) => const SizedBox(
          //             width: 20.0,
          //           ),
          //           itemCount: categoriesModel.data!.data.length,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       const Text(
          //         'New Products',
          //         style: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.w800,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   color: Colors.grey[300],
          //   child: GridView.count(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 5.0,
          //     crossAxisSpacing: 5.0,
          //     childAspectRatio: 1 / 1.60,
          //     children: List.generate(
          //       model.data!.products.length,
          //       (index) => productsItemCardWidget(model, index, context),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
