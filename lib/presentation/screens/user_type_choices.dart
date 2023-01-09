import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/home_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/Navigation_rail.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/user_choice.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserTypeChoices extends StatefulWidget {
     UserTypeChoices({Key? key,
     }) : super(key: key);

  @override
  State<UserTypeChoices> createState() => _UserTypeChoicesState();
}

class _UserTypeChoicesState extends State<UserTypeChoices> {
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
                      action: (){ context.push('/categories');},
                      choiceButtonColor: ColorsManager.choiceActiveColor!),
                      UserChoice(imagePath: 'assets/images/siren.png',
                          choiceText: 'Busters Seeker', imageScale: 6,
                      circleBackgroundColor: ColorsManager.choiceCircleBackground!,
                      action: (){  context.push('/uploadpost');},
                          choiceButtonColor: ColorsManager.choiceActiveColor!)
                    ],

      ),
               ],


         ),
      drawer: Builder(builder: (BuildContext context){
        if(MediaQuery.of(context).size.width.toInt()<=1024){
          return HomeDrawer();
        }else{
          return Rail();
        }
      }),
    );

  }
}
