import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:ecommmerce_app/shared/components/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is FavoritesProductsSuccessState){
          if (!state.favoritesCaseModel!.status){
            AppToast.showToastMessage(message: state.favoritesCaseModel!.message, toastType: ToastType.ERROR);
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        //var cubitData = myCubit.homeModel!.data;
        return Center(
          child: cubit.homeModel != null
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: cubit.homeModel!.data!.banners
                            .map(
                              (banner) => Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      if (banner.id == 11)
                                        Container(color: Color(0xff206000)),
                                      if (banner.id == 12)
                                        Container(color: Color(0xffEF9D1D)),
                                      if (banner.id == 13)
                                        Container(color: Color(0xffF6BDAC)),
                                      Image(
                                        image: NetworkImage(banner.image),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          scrollDirection: Axis.horizontal,
                          height: 200,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'Blueberry Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 12.0,),
                            Container(
                              height: 100.0,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          cubit.categoriesModel!.data!.categoryDataModelList[index].image),
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      color: Colors.black.withOpacity(.8),
                                      padding: EdgeInsets.all(4.0),
                                      width: 100.0,
                                      child: Text(
                                        cubit.categoriesModel!.data!.categoryDataModelList[index].name,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Blueberry Sans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                itemCount: cubit.categoriesModel!.data!.categoryDataModelList.length,
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0,),
                            Text(
                              'New Products',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'Blueberry Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(2.0),
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.7,
                          physics: BouncingScrollPhysics(),
                          children: List.generate(
                            cubit.homeModel!.data!.products.length,
                            (index) => Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Image(
                                        image: NetworkImage(cubit.homeModel!
                                            .data!.products[index].image),
                                        height: 200,
                                        width: double.infinity,
                                      ),
                                      if (cubit.homeModel!.data!.products[index]
                                              .discount !=
                                          0)
                                        Container(
                                          color: Colors.red,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 2.0),
                                          child: Text(
                                            'DISCOUNT',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontFamily: 'Blueberry Sans',
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Container(
                                    height: 95,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            cubit.homeModel!.data!
                                                .products[index].name,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontFamily: 'Blueberry Sans',
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                '${(cubit.homeModel!.data!.products[index].price as num).round()} EGP',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              if (cubit
                                                      .homeModel!
                                                      .data!
                                                      .products[index]
                                                      .discount !=
                                                  0)
                                                Text(
                                                  '${(cubit.homeModel!.data!.products[index].oldPrice as num).round()} EGP',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  cubit.changeFavoriteState(cubit.homeModel!.data!.products[index].id);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(end: 2.0),
                                                  child: Icon(
                                                    cubit.favorites[cubit.homeModel!.data!.products[index].id]! ?  Icons.favorite : Icons.favorite_border,
                                                    color: cubit.favorites[cubit.homeModel!.data!.products[index].id]! ? Colors.red : Colors.black,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
