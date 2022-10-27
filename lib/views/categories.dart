import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
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
  String sportsEquipmentState = 'sportsequipmentoff.jpg';
  Color toysButtonState = ColorsManager.choiceInActiveColor!;
  Color appliancesButtonState = ColorsManager.choiceInActiveColor!;
  Color musicInstrumentsButtonState = ColorsManager.choiceInActiveColor!;
  Color fashionButtonState = ColorsManager.choiceInActiveColor!;
  Color electronicsButtonState = ColorsManager.choiceInActiveColor!;
  Color sportsEquipmentButtonState = ColorsManager.choiceInActiveColor!;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            imageScale: 25,
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
            circleRadius: 60,
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
            choiceText: 'Fashion',
            imageScale: 10,
            action: (){setState(() {
              if(fashionState=='fashionoff.jpg') {
                fashionState = 'fashionon.jpg';
                fashionButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                fashionState='fashionoff.jpg';
                fashionButtonState  = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 65,
            choiceButtonColor: fashionButtonState ,)

            ,
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          UserChoice(
            imagePath: 'assets/images/$sportsEquipmentState',
            choiceText: 'Sports Equipments',
            imageScale:45,
            action: (){setState(() {
              if(sportsEquipmentState=='sportsequipmentoff.jpg') {
                sportsEquipmentState = 'sportsequipmenton.jpg';
                sportsEquipmentButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                sportsEquipmentState ='sportsequipmentoff.jpg';
                sportsEquipmentButtonState = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
            choiceButtonColor: sportsEquipmentButtonState ,),
          UserChoice(
            imagePath: 'assets/images/$toysState',
            choiceText: 'Toys',
            imageScale:50,
            action: (){setState(() {
              if(toysState=='toysoff.jpg') {
                toysState = 'toyson.jpg';
                toysButtonState = ColorsManager.choiceActiveColor!;
              }
              else{
                toysState ='toysoff.jpg';
                toysButtonState = ColorsManager.choiceInActiveColor!;
              }

            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,
            choiceButtonColor: toysButtonState ,),
        ],),

        ElevatedButton(onPressed: (){}, child: Text("Start Busting",
        style: StylesManager.textStyle1,),
          style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.themeColor1),
        )

      ],

    );


  }



}


