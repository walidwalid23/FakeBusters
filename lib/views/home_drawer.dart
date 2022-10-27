import 'package:flutter/material.dart';
import 'package:fakebustersapp/models/colors_manager.dart';

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
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {

            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
      
            },
          ),
        ],
      ),
    );
  }
}
