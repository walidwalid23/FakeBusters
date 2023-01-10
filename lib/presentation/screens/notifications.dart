import 'package:fakebustersapp/domain/entities/notification.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/Navigation_rail.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsScreen extends StatefulWidget {
   NotificationsScreen ({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Notifications'), centerTitle: true,),
      drawer: Builder(builder: (BuildContext context){
        if(MediaQuery.of(context).size.width.toInt()<=1024){
          return HomeDrawer();
        }else{
          return Rail();
        }
      }),
      body: ListView.builder(
          itemCount: 0,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(leading: FaIcon(FontAwesomeIcons.circleExclamation),
              title: Text("notification", style: StylesManager.textStyle1,),
              trailing:IconButton(
                icon: FaIcon(FontAwesomeIcons.x,
                  color: Colors.black,),
                onPressed: (){
                 setState(() {
                   //
                 });

                },
              ) ,
              tileColor: Colors.orange,


              ),
            );
          })
    );
  }
}
