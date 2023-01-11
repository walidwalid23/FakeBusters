import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/post.dart';
import '../controller/post_providers.dart';
import '../reusable_widgets/post_widget.dart';
import 'package:shimmer/shimmer.dart';


class PostsScreen extends ConsumerWidget {
  PostsScreen({Key? key, required this.categories}) : super(key: key);

  List<String> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    print(categories);
    return Scaffold(
      appBar: AppBar(title:Text('Posts'), centerTitle: true,),
      body: SafeArea(
        child:ref.watch(findPostsByCategoriesProvider(categories)).when(
            data: (List<Post> posts){
              return ListView.builder(
                   itemCount: posts.length,
                  itemBuilder:(BuildContext context, int index){
                     return PostWidget(
                       productName: posts[index].productName,
                       productImage: posts[index].productImage,
                       brandName: posts[index].brandName ,
                       productCategory: posts[index].productCategory ,
                       productDate: posts[index].postDate!,
                       uploaderImage: posts[index].uploaderImage,
                       uploaderUsername: posts[index].uploaderUsername ,
                       postID: posts[index].postID,
                       isCurrentUserUploader: posts[index].isCurrentUserUploader,
                       hasCurrentUserVoted: posts[index].hasCurrentUserVoted,
                       categories: categories,
                       isFromDisplay: false,

                     );
                  }
              );
            },
            error: (error,st)=>Center(child:Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            loading: ()=> Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: ColorsManager.themeColor1!,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const SizedBox(height: 300),
                  );
                },
              ),
            )
        )
      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}

