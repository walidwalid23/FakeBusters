import 'package:fakebustersapp/presentation/controller/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../controller/notification_providers.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: GestureDetector(
              onTap: () => context.push('/editprofilescreen'),
              child: CircleAvatar(
                child: Image.asset('assets/images/default_profile_image.png',
                    scale: 1),
                radius: 50,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.houseUser),
            title: Text('Home', style: StylesManager.textStyle1),
            trailing: FaIcon(FontAwesomeIcons.arrowRight),
            onTap: () {
              context.push('/home');
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
                ref.watch(getNotificationsCountProvider(context)).when(
                    data: (notificationsCount) => CircleAvatar(
                          child: Text(notificationsCount.toString(),
                              style: StylesManager.notificationStyle),
                          backgroundColor: Colors.amber,
                          radius: 15,
                        ),
                    error: (error, st) => Text(
                          error.toString(),
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                    loading: () => SpinKitRing(
                          color: ColorsManager.themeColor1!,
                          size: 20,
                        ))
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
              ref.read(userLogoutProvider.notifier).logoutState(context);
            },
          ),
          ref.watch(userLogoutProvider).when(
              data: (data) => Container(),
              error: (error, stackTrace) => Text(
                    error.toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
              loading: () => SpinKitRing(color: ColorsManager.themeColor1!))
        ],
      ),
    );
  }
}
