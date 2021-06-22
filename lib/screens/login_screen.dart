import 'package:ecommmerce_app/screens/register_screen.dart';
import 'package:ecommmerce_app/shared/components/default_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontFamily: 'Blueberry Sans',
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30.0),
                Text(
                  'login now to browse our hot offers.',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.grey.shade600,
                      fontFamily: 'Blueberry Sans',
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 30.0),
                DefaultTextFormField(
                  label: 'Email',
                  prefixIconData: Icons.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                DefaultTextFormField(
                  label: 'Password',
                  prefixIconData: Icons.lock,
                  suffixIconData: Icons.visibility,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () {},
                  height: 60.0,
                  color: Colors.blue,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
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
    );
  }
}

// TextField(decoration: InputDecoration(
// border: OutlineInputBorder(),
// labelText: 'email',
// prefixIcon: Icon(Icons.email),
// suffix: IconButton(
// icon: Icon(Icons.add),
// onPressed: (){},
// ),
