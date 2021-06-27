import 'dart:developer';
import 'package:ecommmerce_app/layouts/shop_layout.dart';
import 'package:ecommmerce_app/models/login_model.dart';
import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/register_cubit/register_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/register_cubit/register_states.dart';
import 'package:ecommmerce_app/shared/components/app_toast.dart';
import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/login_cubit/login_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/login_cubit/login_states.dart';
import 'package:ecommmerce_app/shared/components/default_text_field.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:ecommmerce_app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _phoneController = TextEditingController();

  final _nameController = TextEditingController();

  @override
  void dispose() {
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (LoginModel.authModel!.status!) {
            CacheHelper.saveData(
                key: 'token', value:LoginModel.authModel!.userDataModel!.token);
            Navigator.of(context).pushReplacementNamed(ShopLayout.routeName);
            token = LoginModel.authModel!.userDataModel!.token;
          } else {
            AppToast.showToastMessage(
                message: LoginModel.authModel!.message!, toastType: ToastType.ERROR);
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, right: 20.0, left: 20.0, top: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                            fontFamily: 'Blueberry Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Register now to browse our hot offers.',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey.shade600,
                            fontFamily: 'Blueberry Sans',
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 30.0),
                      DefaultTextFormField(
                        label: 'Name',
                        controller: _nameController,
                        prefixIconData: Icons.person,
                        textInputType: TextInputType.name,
                        submit: (value) {
                          FocusScope.of(context).requestFocus(_phoneFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      DefaultTextFormField(
                        focusNode: _phoneFocus,
                        label: 'Phone',
                        controller: _phoneController,
                        prefixIconData: Icons.phone,
                        textInputType: TextInputType.phone,
                        submit: (value) {
                          FocusScope.of(context).requestFocus(_emailFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your phone';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      DefaultTextFormField(
                        label: 'Email',
                        focusNode: _emailFocus,
                        controller: _emailController,
                        prefixIconData: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        submit: (value) {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      DefaultTextFormField(
                        isPassword: RegisterCubit.get(context).isPasswordShown
                            ? false
                            : true,
                        focusNode: _passwordFocus,
                        label: 'Password',
                        controller: _passwordController,
                        prefixIconData: Icons.lock,
                        suffixIconData: RegisterCubit.get(context).isPasswordShown
                            ? Icons.visibility_off
                            : Icons.visibility,
                        changeVisibilityFunction: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        submit: (value) {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            cubit.register(
                                email: _emailController.text,
                                password: _phoneController.text,
                                name: _nameController.text,
                                phone: _phoneController.text);
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0),
                      (state is RegisterLoadingState)
                          ? Center(child: CircularProgressIndicator())
                          : MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.register(
                                      email: _emailController.text,
                                      password: _phoneController.text,
                                      name: _nameController.text,
                                      phone: _phoneController.text);

                                  FocusScope.of(context).unfocus();
                                }
                              },
                              height: 60.0,
                              color: Colors.blue,
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                'REGISTER',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Blueberry Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('have an account?'),
                          TextButton(
                            child: Text('LOGIN'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
