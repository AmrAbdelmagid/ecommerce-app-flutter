import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String? Function(String?)? validator;
  final VoidCallback? function;

  DefaultTextFormField(
      {this.controller,
      required this.label,
       required this.validator,
      this.prefixIconData,
      this.suffixIconData,
      this.function});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(prefixIconData),
        suffixIcon: IconButton(
          icon: Icon(suffixIconData),
          onPressed: function,
        ),
      ),
    );
  }
}
