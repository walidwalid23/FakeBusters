import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/post_choice_button.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DisplayPost extends StatefulWidget {
  DisplayPost({Key? key,required  this.postData}) : super(key: key);

  Post postData;

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
              subtitle:Row(
                children: [
                  Text(
                    '20 min ago',
                    style: TextStyle(
                        color: ColorsManager.bottomBarUnselectedIconsColor
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.public,
                    size: 14,
                  ),
                ],
              ),
                trailing: IconButton(icon: FaIcon(FontAwesomeIcons.ellipsis),
                onPressed: (){},),),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.deepOrangeAccent[200],
                          child:Container(
                            height: 25,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,3,2,2),
                              child: Text(
                                  'Product Name:${widget.postData.productName}',
                                  style: StylesManager.textStyle1
                              ),
                            ),
                          )
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                          color:Colors.deepOrangeAccent[200],
                          child:
                          Container(
                            height: 25,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,3,2,2),
                              child: Text(
                                  'Brand Name: ${widget.postData.brandName}',
                                  style: StylesManager.textStyle1,
                              ),
                            ),
                          ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        color: Colors.deepOrangeAccent[200],
                          child: Container(
                            height: 25,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,3,2,2),
                              child: Text(
                                  'Product Category:${widget.postData.productCategory}',
                                  style: StylesManager.textStyle1,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
               Container(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     ClipRRect(
                         borderRadius: BorderRadius.circular(15),
                         child: Image.file(
                           // PRODUCT IMAGE
                           widget.postData.productImage,
                           width: 400,
                           height:400,
                         )),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         PostChoiceButton(
                           buttonText: 'Fake',
                         buttonAction: (){},),
                         SizedBox(
                           width: 2,
                         ),
                         PostChoiceButton(
                           buttonText: 'Original',
                           buttonAction: (){},),
                         SizedBox(
                           width: 2,
                         ),
                         FaIcon(FontAwesomeIcons.comment, color: Colors.deepOrange,size:40,)

                     ],),
                     SizedBox(
                       height: 5,
                     ),
                     Row(
                       children:[
                         SizedBox(
                           width: 270,
                         ),
                         Text("12 Comments"),
                      ],
                     )
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
