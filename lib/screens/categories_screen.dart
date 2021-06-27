import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            itemBuilder: (context, index) => ListTile(
              leading: Image(
                height: 100,
                width: 100,
                image: NetworkImage(cubit
                    .categoriesModel.data!.categoryDataModelList[index].image),
              ),
              title: Text(
                  cubit
                      .categoriesModel.data!.categoryDataModelList[index].name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Blueberry Sans',
                  )),
              trailing: IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                  size: 28.0,
                ),
                onPressed: () {},
              ),
            ),
            itemCount:
                cubit.categoriesModel.data!.categoryDataModelList.length,
          );
        });
  }
}
