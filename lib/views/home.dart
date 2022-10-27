import 'package:fakebustersapp/Logic/homeLogic.dart';
import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/values_manager.dart';
import 'package:fakebustersapp/views/home_drawer.dart';
import 'add_post.dart';
import 'categories.dart';
import 'search.dart';
import 'user_type_choices.dart';
import 'package:flutter/material.dart';
import '../models/home_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fakebustersapp/globals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentPageIndex = 0;
  final List<Widget> mainPages = [UserTypeChoices(fakeBusterChoiceAction:fakeBusterChoice,
  bustersSeekerChoiceAction: bustersSeekerChoice,),Search(),Categories(),AddPost()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:PageView(
          controller:pageController,
          children: mainPages,
          onPageChanged: (int index)=> setState((){currentPageIndex = index;}),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
               icon:Icon(Icons.home)
              ,label: HomeManager.bottomNavigationBarItemLabel1),
          BottomNavigationBarItem(
               icon:Icon(Icons.search)
              ,label: HomeManager.bottomNavigationBarItemLabel2  ),
          BottomNavigationBarItem(
               icon:FaIcon(FontAwesomeIcons.userSecret)
              ,label: HomeManager.bottomNavigationBarItemLabel3 ),
          BottomNavigationBarItem(
               icon:FaIcon(FontAwesomeIcons.towerBroadcast)
              ,label: HomeManager.bottomNavigationBarItemLabel4 )
        ],
         currentIndex: currentPageIndex,
         onTap: (int pageIndex){
          print(pageIndex);
          pageController.animateToPage(pageIndex,
              duration: Duration(milliseconds: ValuesManager.swipePageAnimationDuration),
              curve: Curves.easeInCirc);
         },
         unselectedItemColor: ColorsManager.bottomBarUnselectedIconsColor ,
         selectedItemColor: ColorsManager.bottomBarSelectedIconsColor,

        
      ),
    );
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
}
