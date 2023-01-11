import 'package:fakebustersapp/core/utils/constants/Dates_manager.dart';
import 'package:fakebustersapp/presentation/controller/post_providers.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/post.dart';
import '../reusable_widgets/post_widget.dart';




class DisplayNotificationPost extends ConsumerWidget {
  DisplayNotificationPost({Key? key,required  this.postID}) : super(key: key);

  String postID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title:Text('Notification Post'), centerTitle: true,),
      body: SafeArea(
        child: ref.watch(getPostByIDProvider(postID)).when(
            data:(Post post)=> SingleChildScrollView(
              child: PostWidget(
                uploaderUsername:post.uploaderUsername!,
                uploaderImage: post.uploaderImage!,
                productCategory: post.productCategory,
                productImage: post.productImage,
                productName: post.productName,
                brandName: post.brandName,
                postID: post.postID??"",
                // change this date later
                productDate: DatesManager.currentDate+" "+DatesManager.currentTime,
                isCurrentUserUploader: true,
                hasCurrentUserVoted: true,
                isFromDisplay: true,

              ),
            ),
            error: (error,st)=>Center(child:Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            loading: ()=>Center(child: SpinKitRing(color: ColorsManager.themeColor1!)))


      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}
