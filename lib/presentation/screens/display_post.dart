import 'package:fakebustersapp/core/utils/constants/Dates_manager.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/post_choice_button.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/uploaded_post.dart';
import '../reusable_widgets/post_widget.dart';


class DisplayPost extends StatefulWidget {
  DisplayPost({Key? key,required  this.postData}) : super(key: key);

  UploadedPost postData;

  @override
  State<DisplayPost> createState() => _DisplayPostState();
}

class _DisplayPostState extends State<DisplayPost> {

  @override
  Widget build(BuildContext context) {

  print(widget.postData.productImage.runtimeType);
    return Scaffold(
      appBar: AppBar(title:Text('Your Post'), centerTitle: true,),
      body: SafeArea(
        child: PostWidget(
            uploaderUsername:widget.postData.uploaderUsername!,
            uploaderImage: widget.postData.uploaderImage!,
            productCategory: widget.postData.productCategory,
        productImage: widget.postData.productImage,
        productName: widget.postData.productName,
        brandName: widget.postData.brandName,
        // since this widget will be displayed when the user submit a post show the current date
        productDate: DatesManager.currentDate+" "+DatesManager.currentTime,
            isPostUploader:true),


      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}
