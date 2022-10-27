
import 'package:fakebustersapp/reusable_widgets/user_choice.dart';
import 'package:flutter/material.dart';

class UserTypeChoices extends StatelessWidget {
  const UserTypeChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Which One Are You?",),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UserChoice(imagePath: 'assets/images/fakebuster.png',
                        choiceText: 'Fake Buster', imageScale: 1,),
                    UserChoice(imagePath: 'assets/images/siren.png',
                        choiceText: 'Busters Seeker', imageScale: 6,)
                  ],

    ),
             ],


       );

  }
}
