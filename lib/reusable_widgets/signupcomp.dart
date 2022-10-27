import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required var function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
Widget defaultFormField({
  required TextEditingController Controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  required String Label,
  required var validate,
  required IconData prefix,
  var onTap,
  var suffix,
  bool isPassword = false,
  var icon,
}) =>
    TextFormField(
      validator: validate,
      controller: Controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: "${Label}",
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: icon,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
