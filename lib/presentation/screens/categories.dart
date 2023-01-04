import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/user_choice.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
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
  List<String> selectedCategories=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("where is your expertise?"),),
      body: Column(
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
                  selectedCategories.add("electronics");
                }
                else{
                electronicsState='electronicsoff.jpg';
                electronicsButtonState  = ColorsManager.choiceInActiveColor!;
                selectedCategories.remove("electronics");
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
                  selectedCategories.add("appliances");
                }
                else{
                  appliancesState='appliancesoff.jpg';
                  appliancesButtonState = ColorsManager.choiceInActiveColor!;
                  selectedCategories.remove("appliances");
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
                  selectedCategories.add("musicInstruments");
                }
                else{
                  musicInstrumentsState='musicinstrumentsoff.jpg';
                  musicInstrumentsButtonState = ColorsManager.choiceInActiveColor!;
                  selectedCategories.remove("musicInstruments");
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
                  selectedCategories.add("fashion");
                }
                else{
                  fashionState='fashionoff.jpg';
                  fashionButtonState  = ColorsManager.choiceInActiveColor!;
                  selectedCategories.remove("fashion");
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
                  selectedCategories.add("sportsEquipment");

                }
                else{
                  sportsEquipmentState ='sportsequipmentoff.jpg';
                  sportsEquipmentButtonState = ColorsManager.choiceInActiveColor!;
                  selectedCategories.remove("sportsEquipment");
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
                  selectedCategories.add("toys");
                }
                else{
                  toysState ='toysoff.jpg';
                  toysButtonState = ColorsManager.choiceInActiveColor!;
                  selectedCategories.remove("toys");
                }

              });},
              circleBackgroundColor: Colors.white,
              circleRadius: 70,
              choiceButtonColor: toysButtonState ,),
          ],),

          ElevatedButton(
            onPressed: (){
            // make sure the categories list isn't empty
            print("here");
            print(selectedCategories);
          }, child: Text("Start Busting",
          style: StylesManager.textStyle1,),
            style: ElevatedButton.styleFrom(backgroundColor: ColorsManager.themeColor1),
          )

        ],

      ),
      drawer: HomeDrawer(),
    );


  }



}


