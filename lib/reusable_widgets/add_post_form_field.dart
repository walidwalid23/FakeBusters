import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:flutter/material.dart';
class AddPostTextInputField  extends StatelessWidget {
    AddPostTextInputField ({Key? key, required this.label, required this.validatorFunc}) : super(key: key);
  String label;
  String? Function(String? value) validatorFunc;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(15),
    child:TextFormField(
      maxLength: 60,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color:Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.black,),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:ColorsManager.themeColor1!),
        ),

      ),

      validator: validatorFunc,
    )
    );
  }
}
