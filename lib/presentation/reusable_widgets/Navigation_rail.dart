import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/core/utils/constants/values_manager.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:fakebustersapp/presentation/screens/home.dart';
import 'package:fakebustersapp/presentation/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
class Rail extends StatefulWidget {
  const Rail({Key? key}) : super(key: key);

  @override
  State<Rail> createState() => _RailState();
}

class _RailState extends State<Rail> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          minWidth: 70,
          backgroundColor: ColorsManager.themeColor1,
            destinations:[
              NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.houseUser),
                label:  Text('Profile', style: StylesManager.textStyle1),
              ),
              NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.idBadge),
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
              setState(() {
                currentIndex=index;
              });
              if(currentIndex==0){
                context.push('/home');
              }else if(currentIndex==1){
                context.push('/profile');
              }else if(currentIndex==2){
                context.push('/notifications');
              }else if(currentIndex==3){
                context.push('/settings');
              }
            },
        ),
      ],
    );
  }
}

