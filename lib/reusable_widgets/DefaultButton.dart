import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {
  defaultButton({
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
    return Container(
      width: width,
      color: ColorsManager.themeColor1,
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
  }
}
