import 'package:ecommmerce_app/shared/bloc/cubits/search_cubit/search_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/search_cubit/search_states.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/components/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';


  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DefaultTextFormField(
                      label: 'Search Text',
                      validator: (value) {},
                      prefixIconData: Icons.search,
                      controller: searchController,
                      submit: (_){
                       cubit.postAndGetSearchData(searchController.text);
                      },
                    ),
                    SizedBox(height: 20,),
                    if (state is SearchLoadingState)
                    LinearProgressIndicator(),
                    if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index) => Container(
                          height: 120.0,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Image(
                                    image: NetworkImage(cubit.searchModel!.data!.productsData![index].image),
                                    height: 120,
                                    width: 120,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      cubit.searchModel!.data!.productsData![index].name,
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          fontFamily: 'Blueberry Sans',
                                          fontWeight: FontWeight.w500),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          '${(cubit.searchModel!.data!.productsData![index].price as num).round()} EGP',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Spacer(),
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     ShopCubit().changeFavoriteState(ShopCubit().favoritesModel!.data!.listData[index].product!.id);
                                        //   },
                                        //   child: Padding(
                                        //     padding: EdgeInsetsDirectional
                                        //         .only(end: 2.0),
                                        //     child: Icon(
                                        //       ShopCubit().favorites[ShopCubit().favoritesModel?.data!.listData[index].product!.id]! ?  Icons.favorite : Icons.favorite_border,
                                        //       color: ShopCubit().favorites[ShopCubit().favoritesModel?.data!.listData[index].product!.id]! ? Colors.red : Colors.black,
                                        //       size: 24.0,
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ) ,
                        itemCount: cubit.searchModel!.data!.productsData!.length,
                        separatorBuilder: (context,index) => SizedBox(height: 20.0,) ,
                      ),
                    )
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
