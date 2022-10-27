
import 'package:fakebustersapp/reusable_widgets/user_choice.dart';
import 'package:flutter/material.dart';

class UserTypeChoices extends StatelessWidget {
     UserTypeChoices({Key? key,
       required this.fakeBusterChoiceAction,
       required this.bustersSeekerChoiceAction
     }) : super(key: key);

  VoidCallback fakeBusterChoiceAction;
  VoidCallback bustersSeekerChoiceAction;


  @override
  Widget build(BuildContext context) {
    return Column(
           mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Which One Are You?",
               style: TextStyle(fontSize:20,
               fontWeight: FontWeight.bold),),
             SizedBox(height:15),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UserChoice(imagePath: 'assets/images/fakebuster.png',
                        choiceText: 'Fake Buster', imageScale: 1,
                    action: fakeBusterChoiceAction,),
                    UserChoice(imagePath: 'assets/images/siren.png',
                        choiceText: 'Busters Seeker', imageScale: 6,
                    action: bustersSeekerChoiceAction,)
                  ],

    ),
             ],


       );

  }
}
