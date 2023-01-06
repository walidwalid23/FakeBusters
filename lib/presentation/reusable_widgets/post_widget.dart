import 'package:fakebustersapp/presentation/reusable_widgets/post_choice_button.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/voting_commenting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../core/utils/constants/server_manager.dart';
import '../../core/utils/constants/styles_manager.dart';
import '../controller/post_providers.dart';

class PostWidget extends ConsumerWidget {
   PostWidget({Key? key,
  required this.productName,
   required this.productCategory,
   required this.brandName,
   required this.productDate,
   required this.productImage,
   required this.uploaderUsername,
   required this.uploaderImage,
     required this.postID,
     required this.isCurrentUserUploader,
     required this.hasCurrentUserVoted


   }) : super(key: key);

  String productName;
  String productCategory;
  String brandName;
  String productDate;
  dynamic productImage;
  String uploaderUsername;
  String uploaderImage;
   String postID;
   bool isCurrentUserUploader;
   bool hasCurrentUserVoted;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(leading:
          CircleAvatar(backgroundImage:NetworkImage(ServerManager.baseUrl+"\\"+uploaderImage),
            backgroundColor: Colors.deepOrangeAccent,
          ),
            title: Text(uploaderUsername,style: StylesManager.textStyle1,),
            subtitle:Row(
              children: [
                Text(
                  productDate,
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
                      color: Colors.deepOrangeAccent[100],
                      child:Container(

                        height: 25,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10,3,2,2),
                          child: Text(
                              'Product Name: ${productName}',
                              style: StylesManager.textStyle1
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color:Colors.deepOrangeAccent[100],
                    child:
                    Container(
                      height: 25,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,3,2,2),
                        child: Text(
                          'Brand Name: ${brandName}',
                          style: StylesManager.textStyle1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.deepOrangeAccent[100],
                    child: Container(
                      height: 25,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10,3,2,2),
                        child: Text(
                          'Product Category: ${productCategory}',
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
                      child:(productImage.runtimeType==String)?
                      Image.network(ServerManager.baseUrl+"\\"+productImage):
                       Image.file(productImage)
                  )
                    ,
                  SizedBox(height:10)
                  ,
                  // IF THE USER IS THE UPLOADER OF THE POST OR ALREADY VOTED ONLY SHOW THE PERCENTAGES
            VotingCommentingRow(hasCurrentUserVoted: hasCurrentUserVoted, isCurrentUserUploader: isCurrentUserUploader, postID: postID)
                  ,
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
      ),),
    );
  }
}
