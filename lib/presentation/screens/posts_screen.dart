import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/post.dart';
import '../controller/post_providers.dart';
import '../reusable_widgets/post_widget.dart';

class PostsScreen extends ConsumerWidget {
  PostsScreen({Key? key, required this.categories}) : super(key: key);

  List<String> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("in build now");
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

                     );
                  }
              );
            },
            error: (error,st)=>Center(child:Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
            loading: ()=>Center(child: SpinKitRing(color: ColorsManager.themeColor1!)))
      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}

