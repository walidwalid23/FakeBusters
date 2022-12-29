import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.text,
    this.width = double.infinity,
    required this.function,
  }) : super(key: key);

  String text;
  double width;
  var function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: function,
         style:ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.themeColor1
             ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
