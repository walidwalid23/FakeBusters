import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    Key? key,
    required this.type,
    required this.Controller,
    required this.Label,
    required this.validate,
    required this.prefix,
    this.isPassword = false,
    this.iconSwitch,
    this.suffix,
  }) : super(key: key);
  TextEditingController Controller;
  TextInputType type;
  String Label;
  var validate;
  IconData prefix;
  var suffix;
  bool isPassword;
  var iconSwitch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: Controller,
      keyboardType: type,
      obscureText: isPassword,
      maxLength: 50,
      decoration: InputDecoration(
        labelText: "${Label}",
        prefixIcon: Icon(prefix, color: ColorsManager.themeColor1),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: iconSwitch,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}
