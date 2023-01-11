import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/post.dart';
import '../controller/post_providers.dart';
import '../reusable_widgets/home_drawer.dart';
import '../reusable_widgets/post_widget.dart';

class Search extends ConsumerStatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 50,
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: 'Search For Products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 20),
                    borderRadius: BorderRadius.circular(30.0),
                  )),
              onSubmitted: (String productName) {
                if (productName != "") {
                  ref.read(searchPostsByProductNameProvider(context).notifier)
                      .searchPostsByProductNameState(productName);
                }
              },
            ),
          ),
        ),
        body: ref.watch(searchPostsByProductNameProvider(context)).when(
              data: (posts) {
                // DISPLAY STATIC SEARCH LOGO BEFORE THE USER SUBMIT HIS SEARCH
                if (posts == null) {
                  return Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/search.png'));
                }
                //ELSE
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostWidget(
                        productName: posts[index].productName,
                        productImage: posts[index].productImage,
                        brandName: posts[index].brandName,
                        productCategory: posts[index].productCategory,
                        productDate: posts[index].postDate!,
                        uploaderImage: posts[index].uploaderImage,
                        uploaderUsername: posts[index].uploaderUsername,
                        postID: posts[index].postID,
                        isCurrentUserUploader:
                            posts[index].isCurrentUserUploader,
                        hasCurrentUserVoted: posts[index].hasCurrentUserVoted,
                        isFromDisplay: true,

                      );
                    });
              },
              error: (error, st) => Center(
                  child: Text(
                error.toString(),
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              )),
              loading: () => Align(
                  alignment: Alignment.center,
                  child: RotationTransition(
                      turns: _animationController,
                      child: Image.asset('assets/images/search.png'))),
            ),
        drawer: HomeDrawer());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
