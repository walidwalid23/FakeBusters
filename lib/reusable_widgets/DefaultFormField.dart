import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({Key? key,
    required this.type,
    this.width = double.infinity,
    required this.Controller,
    this.background=Colors.blue,
  }) : super(key: key);
  TextEditingController Controller;
  TextInputType type;
  String Label;
  Color background;
  var validate;
  IconData prefix;
  var suffix;
  bool isPassword;
  var icon;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
Widget defaultFormField({
  required TextEditingController Controller,
  required TextInputType type,
  required String Label,
  required var validate,
  required IconData prefix,
  var suffix,
  bool isPassword=false,
  var icon,
})=>TextFormField(
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