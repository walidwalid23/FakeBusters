import 'package:fakebustersapp/models/notification_model.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/views/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsScreen extends StatefulWidget {
   NotificationsScreen ({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(text:'user1 reacted to your post',isNew:true),
    NotificationModel(text:'user2 reacted to your post',isNew:false),
    NotificationModel(text:'user3 reacted to your post',isNew:false),
    NotificationModel(text:'user4 reacted to your post',isNew:false),
    NotificationModel(text:'user5 reacted to your post',isNew:false),
    NotificationModel(text:'user6 reacted to your post',isNew:false),
    NotificationModel(text:'user7 reacted to your post',isNew:false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Notifications'), centerTitle: true,),
      drawer: HomeDrawer(),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(leading: FaIcon(FontAwesomeIcons.circleExclamation),
              title: Text(notifications[index].text, style: StylesManager.textStyle1,),
              trailing:IconButton(
                icon: FaIcon(FontAwesomeIcons.x,
                  color: Colors.black,),
                onPressed: (){
                 setState(() {
                   notifications.removeAt(index);
                 });

                },
              ) ,
              tileColor: Colors.orange,
                enabled: (notifications[index].isNew)? true : false,

              ),
            );
          })
    );
  }
}
