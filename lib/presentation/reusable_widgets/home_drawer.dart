import 'package:fakebustersapp/presentation/controller/user_providers.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/Navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/constants/server_manager.dart';
import '../../domain/entities/user.dart';
import '../controller/notification_providers.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (MediaQuery.of(context).size.width.toInt() >= 807) {
      return Rail();
    } else {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: GestureDetector(
                onTap: () => context.push('/settings'),
                child: ref.watch(getUserDataProvider(context)).when(
                    data: (User userData) => CircleAvatar(
                          foregroundImage: NetworkImage(ServerManager.baseUrl +
                              "\\" +
                              userData.profileImage),
                          radius: 80,
                          backgroundColor: Colors.white,
                        ),
                    error: (err, st) => Text(
                          err.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                    loading: () =>
                        SpinKitRing(color: ColorsManager.themeColor1!)),
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.houseUser,
                color: Colors.deepOrange,
              ),
              title: Text('Home', style: StylesManager.textStyle1),
              trailing: FaIcon(
                FontAwesomeIcons.arrowRight,
              ),
              onTap: () {
                context.push('/home');
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.idBadge,
                color: Colors.deepOrange,
              ),
              title: Text('Profile', style: StylesManager.textStyle1),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () {
                context.push('/profile');
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.deepOrange,
              ),
              title: Row(
                children: [
                  Text('Notifications', style: StylesManager.textStyle1),
                  SizedBox(width: 10),
                  ref.watch(getNotificationsCountProvider(ref)).when(
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
              leading: FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.deepOrange,
              ),
              title: Text('Settings', style: StylesManager.textStyle1),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
              onTap: () {
                context.push('/settings');
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.lightbulb,
                color: Colors.deepOrange,
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
              leading: FaIcon(
                FontAwesomeIcons.rightFromBracket,
                color: Colors.deepOrange,
              ),
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
}
