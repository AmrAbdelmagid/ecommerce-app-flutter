import 'dart:developer';

import 'package:ecommmerce_app/models/login_model.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/shop_cubit/shop_states.dart';
import 'package:ecommmerce_app/shared/components/default_text_field.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/setting';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          APP_NAME,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(
              color: Colors.black,
              fontFamily: 'Blueberry Sans',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var cubit = ShopCubit.get(context);
          if (LoginModel.authModel != null) {
            name.text = LoginModel.authModel!.userDataModel!.name;
            email.text = LoginModel.authModel!.userDataModel!.email;
            phone.text = LoginModel.authModel!.userDataModel!.phone;
          }
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  if (state is UpdateUserDataLoadingState)
                    LinearProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [

                        DefaultTextFormField(
                          label: 'Name',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: 'Blueberry Sans',
                              fontWeight: FontWeight.w400) ,
                          validator: (value) {},
                          prefixIconData: Icons.person,
                          textInputType: TextInputType.name,
                          controller: name,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DefaultTextFormField(
                          label: 'Email',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: 'Blueberry Sans',
                              fontWeight: FontWeight.w400) ,
                          validator: (value) {},
                          prefixIconData: Icons.email,
                          textInputType: TextInputType.emailAddress,
                          controller: email,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DefaultTextFormField(
                          label: 'Phone',
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: 'Blueberry Sans',
                              fontWeight: FontWeight.w400) ,
                          validator: (value) {},
                          prefixIconData: Icons.phone,
                          textInputType: TextInputType.phone,
                          controller: phone,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            ShopCubit.get(context).updateUserData(name.text, email.text, phone.text);
                          },
                          height: 60.0,
                          color: Colors.blue,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'UPDATE',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontFamily: 'Blueberry Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () async {
                            bool response =
                            await CacheHelper.removeData(key: 'token');
                            if (response) {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                              name.clear();
                              phone.clear();
                              email.clear();
                            }
                          },
                          height: 60.0,
                          color: Colors.blue,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'LOGOUT',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontFamily: 'Blueberry Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
