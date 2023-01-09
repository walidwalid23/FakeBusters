import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/core/utils/constants/values_manager.dart';
import 'package:fakebustersapp/presentation/screens/edit_profile.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:fakebustersapp/presentation/screens/home.dart';
import 'package:fakebustersapp/presentation/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Rail extends StatefulWidget {
  const Rail({Key? key}) : super(key: key);

  @override
  State<Rail> createState() => _RailState();
}

class _RailState extends State<Rail> {
  int currentIndex = 0;
  final List<Widget> Pages = [EditProfileScreen(),Home(),NotificationsScreen(),HintScreen()];
  PageController pageController = PageController(initialPage:0);
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
          destinations:[
            NavigationRailDestination(
              icon: FaIcon(FontAwesomeIcons.idBadge),
              label:  Text('Profile', style: StylesManager.textStyle1),
            ),
            NavigationRailDestination(
              icon: FaIcon(FontAwesomeIcons.houseUser),
              label:  Text(
                'Home',
                style: StylesManager.textStyle1,
              ),
            ),
            NavigationRailDestination(
              icon: FaIcon(FontAwesomeIcons.bell),
              label:  Text('Notifications', style: StylesManager.textStyle1),
            ),
            NavigationRailDestination(
              icon: FaIcon(FontAwesomeIcons.gear),
              label:  Text('Settings', style: StylesManager.textStyle1),
            ),
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: (index){
            pageController.animateToPage(index,
                duration: Duration(milliseconds: ValuesManager.swipePageAnimationDuration),
                curve: Curves.easeInCirc);
          },
    );
  }
}

