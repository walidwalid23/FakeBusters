import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/reusable_widgets/post_choice_button.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisplayPost extends StatefulWidget {
  const DisplayPost({Key? key}) : super(key: key);

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Your Post'), centerTitle: true,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(leading:
              CircleAvatar(backgroundImage:AssetImage('assets/images/usericon2.png'),
                backgroundColor: Colors.deepOrangeAccent,
              ),
              title: Text('Walid Mohamed',style: StylesManager.textStyle1,),
              subtitle:Text('20 min ago',style: TextStyle(color: ColorsManager.bottomBarUnselectedIconsColor),)
                ,trailing: IconButton(icon: FaIcon(FontAwesomeIcons.ellipsis),
                onPressed: (){},),),
              Text('Product Name: rayban glasses model 238',style: StylesManager.textStyle1),
              Text('Brand Name: rayban',style: StylesManager.textStyle1),
              Text('Product Category: Fashion',style: StylesManager.textStyle1),
               Container(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     ClipRRect(
                         borderRadius: BorderRadius.circular(15),
                         child: Image.asset('assets/images/rayban.jpg',
                           width: 400,
                           height:400,
                         )),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         PostChoiceButton(
                           buttonText: 'Fake',
                         buttonAction: (){},),
                         PostChoiceButton(
                           buttonText: 'Original',
                           buttonAction: (){},),
                         FaIcon(FontAwesomeIcons.comment, color: Colors.deepOrange,size:40,)

                     ],)
                   ],
                 ),
               ),
               )
              
            ],
          ),decoration: BoxDecoration(
            color: Colors.white
          )),
        ),
      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}
