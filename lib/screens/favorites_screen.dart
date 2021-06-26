import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return (state is GettingFavoritesProductsLoadingState) ? Center(child: CircularProgressIndicator()) :  ListView.separated(
            physics: BouncingScrollPhysics(),
             itemBuilder: (context,index) => Padding(
               padding: const EdgeInsets.all(16.0),
               child: Container(
                 height: 120.0,
                 width: double.infinity,
                 child: Row(
                   children: [
                     Stack(
                       alignment: AlignmentDirectional.bottomStart,
                       children: [
                         Image(
                           image: NetworkImage(cubit.favoritesModel!.data!.listData[index].product!.image),
                           height: 120,
                           width: 120,
                         ),
                         if (cubit.favoritesModel!.data!.listData[index].product!.discount !=
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
                     Expanded(
                       child: Column(
                         crossAxisAlignment:
                         CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text(
                             cubit.favoritesModel!.data!.listData[index].product!.name,
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
                                 '${(cubit.favoritesModel!.data!.listData[index].product!.price as num).round()} EGP',
                                 style: TextStyle(
                                   fontSize: 13.0,
                                   color: Colors.blue,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                               SizedBox(
                                 width: 2.0,
                               ),
                               if (cubit.favoritesModel!.data!.listData[index].product!.discount !=
                                   0)
                                 Text(
                                   '${(cubit.favoritesModel!.data!.listData[index].product!.oldPrice as num).round()} EGP',
                                   style: TextStyle(
                                     fontSize: 13.0,
                                     decoration: TextDecoration
                                         .lineThrough,
                                     color: Colors.grey,
                                   ),
                                 ),
                               Spacer(),
                               GestureDetector(
                                 onTap: () {
                                   cubit.changeFavoriteState(cubit.favoritesModel!.data!.listData[index].product!.id);
                                 },
                                 child: Padding(
                                   padding: EdgeInsetsDirectional
                                       .only(end: 2.0),
                                   child: Icon(
                                     cubit.favorites[cubit.favoritesModel!.data!.listData[index].product!.id]! ?  Icons.favorite : Icons.favorite_border,
                                     color: cubit.favorites[cubit.favoritesModel!.data!.listData[index].product!.id]! ? Colors.red : Colors.black,
                                     size: 24.0,
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ) ,
            itemCount: cubit.favoritesModel!.data!.listData.length ,
            separatorBuilder: (context,index) => SizedBox(height: 12.0,) ,
          );
    });
  }
}
