import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/widgets/text_form_field_widget.dart';
import '../../../logic/cubit/search/search_cubit.dart';
import '../../../shared/widgets/search_Item_Card_Widget.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      textController: searchController,
                      text: 'Search...',
                      keyPadType: TextInputType.text,
                      prefixIcon: const Icon(Icons.search),
                      isPassword: false,
                      validate: (value) {
                        if (value!.isEmpty) return 'Enter name of product';
                        return null;
                      },
                      onSubmit: (String nameProduct) {
                        SearchCubit.get(context).searchProduct(nameProduct);
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => searchItemCardWidget(
                            SearchCubit.get(context)
                                .searchModel!
                                .data!
                                .data![index],
                            context,
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) =>
                              const Divider(height: 2.0),
                          itemCount: SearchCubit.get(context)
                              .searchModel!
                              .data!
                              .data!
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
