import 'package:flutter/material.dart';
import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              color:ColorsManager.themeColor1,
            ),
            child: CircleAvatar(child: Image.asset('assets/images/usericon.png',scale:1 ),
              radius:50,
              backgroundColor: Colors.white,),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.idBadge),
            title: Text('Profile',style:StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {

            },
          ),
         
        ],
      ),
    );
  }
}
