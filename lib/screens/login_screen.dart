import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/shared/bloc/cubits/login_cubit.dart';
import 'package:ecommmerce_app/shared/bloc/states/states.dart';
import 'package:ecommmerce_app/shared/components/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _passwordFocus = FocusNode();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.black,
                                  fontFamily: 'Blueberry Sans',
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          'login now to browse our hot offers.',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.grey.shade600,
                                  fontFamily: 'Blueberry Sans',
                                  fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: 30.0),
                        DefaultTextFormField(
                          label: 'Email',
                          controller: _emailController,
                          prefixIconData: Icons.email,
                          textInputType: TextInputType.emailAddress,
                          submit: (value){
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
                          isPassword: LoginCubit.get(context).isPasswordShown ? false : true,
                          focusNode: _passwordFocus,
                          label: 'Password',
                          controller: _passwordController,
                          prefixIconData: Icons.lock,
                          suffixIconData: LoginCubit.get(context).isPasswordShown ? Icons.visibility_off : Icons.visibility,
                          changeVisibilityFunction: (){
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          submit: (value){
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              LoginCubit.get(context).login(email: _emailController.text, password: _passwordController.text);
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
                        (state is LoginLoadingState) ? Center(child: CircularProgressIndicator()) : MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              LoginCubit.get(context).login(email: _emailController.text, password: _passwordController.text);
                            }
                          },
                          height: 60.0,
                          color: Colors.blue,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            'LOGIN',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Blueberry Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('don\'t have an account?'),
                            TextButton(
                              child: Text('REGISTER'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
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
      ),
    );
  }
}
