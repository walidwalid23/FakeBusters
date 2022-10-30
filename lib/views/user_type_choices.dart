import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/home_manager.dart';
import 'package:fakebustersapp/reusable_widgets/user_choice.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(HomeManager.appName),
        centerTitle: true,),
      body: Column(
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
                      circleBackgroundColor: ColorsManager.choiceCircleBackground!,
                      action: fakeBusterChoiceAction,
                      choiceButtonColor: ColorsManager.choiceActiveColor!),
                      UserChoice(imagePath: 'assets/images/siren.png',
                          choiceText: 'Busters Seeker', imageScale: 6,
                      circleBackgroundColor: ColorsManager.choiceCircleBackground!,
                      action: bustersSeekerChoiceAction,
                          choiceButtonColor: ColorsManager.choiceActiveColor!)
                    ],

      ),
               ],


         ),
      drawer: HomeDrawer(),
    );

  }
}
