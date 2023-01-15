import 'package:fakebustersapp/core/utils/constants/Dates_manager.dart';
import 'package:fakebustersapp/presentation/controller/post_providers.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/post.dart';
import '../reusable_widgets/post_widget.dart';




class DisplayNotificationPost extends ConsumerStatefulWidget {
  DisplayNotificationPost({Key? key,required  this.postID}) : super(key: key);

  String postID;

  @override
  ConsumerState<DisplayNotificationPost> createState() => _DisplayNotificationPostState();
}

class _DisplayNotificationPostState extends ConsumerState<DisplayNotificationPost> {
  String pushMessage="";

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;

    if(arguments!=null){
      Map? pushArguments = arguments as Map;

      setState(() {
        pushMessage = pushArguments["message"];
        print("dependencies changed");
      });
    }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text('Notification Post'), centerTitle: true,),
      body: SafeArea(
        child: ref.watch(getPostByIDProvider(widget.postID)).when(
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
