import 'package:fakebustersapp/models/colors_manager.dart';
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
            Container(
              padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border:  Border.all(
                    color: Colors.orange,
                    width: 3,
                  ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        3.0,
                        3.0,
                      ), //Offset
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: Text(choiceText))

          ],
        ),
      ),
    );
  }
}
