import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class AddPostTextInputField extends StatelessWidget {
  AddPostTextInputField(
      {Key? key,
      required this.label,
      required this.validatorFunc,
      required this.textFieldController})
      : super(key: key);
  String label;
  String? Function(String? value) validatorFunc;
  TextEditingController textFieldController;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextFormField(
          controller: textFieldController,
          maxLength: 60,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: label,
            labelStyle: TextStyle(color: ColorsManager.themeColor1),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.themeColor1!),
            ),
          ),
          validator: validatorFunc,
        ));
  }
}
