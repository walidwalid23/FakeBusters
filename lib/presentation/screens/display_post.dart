import 'package:fakebustersapp/core/utils/constants/Dates_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/uploaded_post.dart';
import '../reusable_widgets/post_widget.dart';




class DisplayPost extends StatelessWidget {
  DisplayPost({Key? key,required  this.postData}) : super(key: key);

  UploadedPost postData;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text('Uploaded Post'), centerTitle: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: PostWidget(
              uploaderUsername:postData.uploaderUsername!,
              uploaderImage: postData.uploaderImage!,
              productCategory: postData.productCategory,
          productImage: postData.productImage,
          productName: postData.productName,
          brandName: postData.brandName,
          postID: postData.postID??"",
          isFromDisplay: true,
          // since this widget will be displayed when the user submit a post show the current date
          productDate: DatesManager.currentDate+" "+DatesManager.currentTime,
            isCurrentUserUploader: true,
          hasCurrentUserVoted: true,
          ),
        ),


      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}
