import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/reusable_widgets/user_choice.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String toysState = 'toysoff.jpg';
  String appliancesState = 'appliancesoff.jpg';
  String musicInstrumentsState = 'musicinstrumentsoff.jpg';
  String fashionState = 'fashionoff.jpg';
  String electronicsState = 'electronicsoff.jpg';
  String sportsEquipmentState = 'sportsEquipmentoff.jpg';
  Color toysButtonState = ColorsManager.choiceInActiveColor!;
  Color appliancesButtonState = ColorsManager.choiceInActiveColor!;
  Color musicInstrumentsButtonState = ColorsManager.choiceInActiveColor!;
  Color fashionButtonState = ColorsManager.choiceInActiveColor!;
  Color electronicsButtonState = ColorsManager.choiceInActiveColor!;
  Color sportsEquipmentButtonState = ColorsManager.choiceInActiveColor!;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          UserChoice(
            imagePath: 'assets/images/$electronicsState',
            choiceText: 'Electronics',
            imageScale: 45,
            action: (){setState(() {
              if(electronicsState=='electronicsoff.jpg') {
                electronicsState = 'electronicson.jpg';
                electronicsButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
              electronicsState='electronicsoff.jpg';
              electronicsButtonState  = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
          choiceButtonColor: electronicsButtonState ,)
          ,
          UserChoice(
            imagePath: 'assets/images/$appliancesState',
            choiceText: 'Appliances',
            imageScale: 45,
            action: (){setState(() {
              if(appliancesState=='appliancesoff.jpg') {
                appliancesState = 'applianceson.jpg';
                appliancesButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                appliancesState='appliancesoff.jpg';
                appliancesButtonState = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
            choiceButtonColor: appliancesButtonState,)
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          UserChoice(
            imagePath: 'assets/images/$musicInstrumentsState',
            choiceText: 'Music Instruments',
            imageScale: 45,
            action: (){setState(() {
              if(musicInstrumentsState=='musicinstrumentsoff.jpg') {
                musicInstrumentsState = 'musicinstrumentson.jpg';
                musicInstrumentsButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                musicInstrumentsState='musicinstrumentsoff.jpg';
                musicInstrumentsButtonState = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
            choiceButtonColor: musicInstrumentsButtonState,),
          UserChoice(
            imagePath: 'assets/images/$fashionState',
            choiceText: 'Electronics',
            imageScale: 45,
            action: (){setState(() {
              if(fashionState=='electronicsoff.jpg') {
                fashionState = 'electronicson.jpg';
                fashionButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                fashionState='electronicsoff.jpg';
                fashionButtonState  = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
            choiceButtonColor: fashionButtonState ,)

            ,
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          Image.asset('assets/images/sportsequipmentoff.jpg',scale:40),
          Image.asset('assets/images/musicinstrumentsoff.jpg',scale:40),
        ],)

      ],

    );


  }



}


