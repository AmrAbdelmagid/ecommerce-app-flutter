import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/setting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('Settings Screen'),
        ),
      ),
    );
  }
}
