import 'package:application/models/colors_manager.dart';
import 'package:flutter/material.dart';


class UserChoice extends StatelessWidget {
   UserChoice({Key? key,
    required this.imagePath,
    required this.choiceText,
      this.circleRadius = 50,
     required this.imageScale
  }) : super(key: key);

  String imagePath;
  double circleRadius;
  double imageScale;
  String choiceText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          child: Column(
          children: [
            CircleAvatar(child: Image.asset(imagePath,scale:imageScale ),
                radius:circleRadius,
            backgroundColor: ColorsManager.choiceCircleBackground,),
            Text(choiceText)

          ],
        ),
      ),
    );
  }
}
