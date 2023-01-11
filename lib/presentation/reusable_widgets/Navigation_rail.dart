import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/core/utils/constants/values_manager.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:fakebustersapp/presentation/screens/home.dart';
import 'package:fakebustersapp/presentation/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../controller/user_providers.dart';
class Rail extends ConsumerStatefulWidget {
  const Rail({Key? key}) : super(key: key);

  @override
  ConsumerState<Rail> createState() => _RailState();
}

class _RailState extends ConsumerState<Rail> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          minWidth: 45,
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
              NavigationRailDestination(
                icon: FaIcon(
                  FontAwesomeIcons.lightbulb,
                ),
                label:  Text(
                  'Hints',
                  style: StylesManager.textStyle1,
                ),
              ),
              NavigationRailDestination(
                icon: FaIcon(
                  FontAwesomeIcons.rightFromBracket,
                ),
                label:  Text(
                  'Hints',
                  style: StylesManager.textStyle1,
                ),
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
              }else if(currentIndex==4){
                context.push('/hintscreen');
              }else if(currentIndex==5){
                ref.read(userLogoutProvider.notifier).logoutState(context);
              }
            },
        ),
        ref.watch(userLogoutProvider).when(
            data: (data) => Container(),
            error: (error, stackTrace) => Text(
              error.toString(),
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
            loading: () => SpinKitRing(color: ColorsManager.themeColor1!)
        ),
      ],
    );
  }
}

