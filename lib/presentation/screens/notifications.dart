import 'package:fakebustersapp/domain/entities/notification.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/Navigation_rail.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/constants/colors_manager.dart';
import '../controller/notification_providers.dart';



class NotificationsScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar:AppBar(title:Text('Notifications'), centerTitle: true,),
      drawer: Builder(builder: (BuildContext context){
        if(MediaQuery.of(context).size.width.toInt()<=1024){
          return HomeDrawer();
        }else{
          return Rail();
        }
      }),
      body: ref.watch(userNotificationsProvider(context)).when(
          data: (List<NotificationEntity> notifications)=>
              ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context,i){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(leading: FaIcon(FontAwesomeIcons.circleExclamation),
                    title: Text(notifications[i].notificationText, style: StylesManager.textStyle1,),
                    tileColor: Colors.orange,
                    subtitle: Text(notifications[i].notificationDate),
                    trailing:IconButton(
                      icon:  FaIcon(FontAwesomeIcons.x,color: Colors.black,),
                        onPressed: (){
                          //DELETE THE NOTIFICATION
                          ref.read(userNotificationsProvider(context).notifier).deleteUserNotificationState(notifications[i].notificationID);
                        }

                     )),

                    );}
                  ),

          error: (error, trace)=> Center(child: Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
          loading: ()=> Center(child: SpinKitRing(color: ColorsManager.themeColor1!)))
                );
              }
  }

