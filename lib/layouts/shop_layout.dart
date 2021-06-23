import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  static const routeName = '/shop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME),),
      body: Container(
        child: Center(child: TextButton(child: Text('logout'),onPressed: ()async{
          bool response = await CacheHelper.removeData(key: 'token');
          if (response){
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          }
        },)),
      ),
    );
  }
}
