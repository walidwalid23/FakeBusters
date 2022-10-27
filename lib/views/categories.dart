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
  String fashionsState = 'fashionoff.jpg';
  String electronicsState = 'electronicsoff.jpg';
  String sportsEquipmentState = 'sportsEquipmentoff.jpg';


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
              (electronicsState=='electronicsoff.jpg')?electronicsState='electronicson.jpg'
                  :
              electronicsState='electronicsoff.jpg';
            });},
            circleBackgroundColor: Colors.white,
            circleRadius: 70,)
          ,
          CircleAvatar(child: Image.asset('assets/images/appliancesoff.jpg',scale:50,),
              backgroundColor: Colors.white,
              radius: 70)
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          Image.asset('assets/images/electronicsoff.jpg',scale:40),
          Image.asset('assets/images/fashionoff.jpg',scale:40),
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


