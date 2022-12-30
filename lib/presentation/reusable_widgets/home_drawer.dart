import 'package:fakebustersapp/presentation/controller/homeLogic.dart';
import 'package:fakebustersapp/presentation/screens/Profile.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorsManager.themeColor1,
            ),
            child: CircleAvatar(
              child: Image.asset('assets/images/default_profile_image.png', scale: 1),
              radius: 50,
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.houseUser),
            title: Text('Home', style: StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.go('/');
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.idBadge),
            title: Text('Profile', style: StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.push('/profile');
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.bell),
            title: Row(
              children: [
                Text('Notifications', style: StylesManager.textStyle1),
                SizedBox(width: 10),
                CircleAvatar(
                  child: Text("1", style: StylesManager.notificationStyle),
                  backgroundColor: Colors.blueGrey[500],
                  radius: 15,
                )
              ],
            ),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.push('/notifications');
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.gear),
            title: Text('Settings', style: StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.push('/settings');
            },
          ),
          ListTile(
            leading: FaIcon(
                FontAwesomeIcons.lightbulb,
            ),
            title: Text(
                'Hints',
                style: StylesManager.textStyle1,
            ),
            trailing: FaIcon(
                FontAwesomeIcons.arrowRight,
            ),
            onTap: () {
              context.push('/hintscreen');

            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.rightFromBracket),
            title: Text('Log Out', style: StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.go('/login');

            },
          ),
        ],
      ),
    );
  }
}
