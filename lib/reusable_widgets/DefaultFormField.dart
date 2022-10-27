import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
   DefaultFormField({Key? key,
    required this.type,
    required this.Controller,
    required this.Label,
    required this.validate,
    required this.prefix,
    this.isPassword=false,
    this.icon,
    this.suffix,
  }) : super(key: key);
  TextEditingController Controller;
  TextInputType type;
  String Label;
  var validate;
  IconData prefix;
  var suffix;
  bool isPassword;
  var icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
      validate,
      controller:Controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: "${Label}",
        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: suffix!= null? IconButton(
          onPressed: icon,
          icon: Icon(
              suffix
          ),
        ):null,
        border:OutlineInputBorder(),
      ),
    );
  }
}