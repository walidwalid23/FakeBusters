import 'package:flutter/material.dart';

class  Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ,children: [
          Image.asset('assets/images/toysoff.jpg',scale:40),
          Image.asset('assets/images/appliancesoff.jpg',scale:40),
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
