import 'package:fakebustersapp/domain/entities/vote.dart';
import 'package:fakebustersapp/domain/usecases/get_post_votes_usecase.dart';
import 'package:fakebustersapp/domain/usecases/increment_orginal_votes_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/exception_handling/failures.dart';
import '../../data/data_repository/post_repository.dart';
import '../../data/data_source/base_post_remote_datasource.dart';
import '../../data/data_source/post_remote_datasource.dart';
import '../../domain/domain_repository/base_post_repository.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/uploaded_post.dart';
import '../../domain/usecases/find_posts_by_categories_usecase.dart';
import '../../domain/usecases/get_post_by_id.dart';
import '../../domain/usecases/increment_fake_votes_usecase.dart';
import '../../domain/usecases/search_posts_by_product_name_usecase.dart';
import '../../domain/usecases/upload_post_usecase.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import '../../domain/usecases/delete_post_usecase.dart';

class UploadPostEvent extends StateNotifier<AsyncValue<dynamic>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  String? notificationToken;
  BuildContext context;
  UploadPostEvent(this.context) : super(AsyncData(null)) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      notificationToken = prefs.getString('notificationToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }
    });
  }

  void uploadPostState(UploadedPost post) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    UploadPostUseCase uploadPostUseCase = UploadPostUseCase(postRepository);


    super.state = AsyncLoading();
    Either<Failure, UploadingPostSuccess> data =
        await uploadPostUseCase.excute(post, userToken!, notificationToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (UploadingPostSuccess success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);

      UploadedPost uploadedPostWithUploader = UploadedPost(productName: post.productName,
          brandName: post.brandName, productCategory: post.productCategory, productImage: post.productImage,
      uploaderImage: success.uploaderImage, uploaderUsername: success.uploaderUsername,
          postID: success.postID
      );
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg: success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      context.push('/displaypost', extra: uploadedPostWithUploader);
    });
  }
}

class FindPostsByCategoriesEvent extends StateNotifier<AsyncValue<List<Post>>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  List<String> categories;
  FindPostsByCategoriesEvent(this.categories) : super(AsyncLoading()) {
    print("in provider constructor");
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        super.state = AsyncError("You Aren't Allowed To Display Posts", StackTrace.current);
      }

      else{
        // update the state with the posts
        findPostsByCategoriesState(categories);
      }

    });
  }

  void findPostsByCategoriesState(List<String> categories) async {
    print('in the state event');
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    FindPostsByCategoriesUseCase findPostsByCategoriesUseCase = FindPostsByCategoriesUseCase(postRepository);

    Either<Failure, List<Post>> data =
    await findPostsByCategoriesUseCase.excute(categories, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    },
            (List<Post> posts) {

      super.state = AsyncData(posts);

    });
  }

  void deletePostByIDState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    DeletePostByIDUseCase deletePostByIDUseCase = DeletePostByIDUseCase(postRepository);

    Either<Failure, Success> data =
    await deletePostByIDUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
          super.state = AsyncError(failure.errorMessage, failure.stackTrace);
        },
            (Success success) {
              Fluttertoast.showToast(
                  msg: success.successMessage,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16);
              // DELETE THE POST FROM THE CURRENT LIST THEN UPDATE ITS STATE
              List<Post> posts = state.value!; // = ASYNCDATA(value).value
              posts.removeWhere((post) => post.postID == postID);

              print(posts);
              super.state = AsyncData(posts);


        });
  }





}

class SearchPostsByProductNameEvent extends StateNotifier<AsyncValue<dynamic>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  SearchPostsByProductNameEvent(this.context) : super(AsyncData(null)) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }
    });
  }

  void searchPostsByProductNameState(String productName) async {
    print('in the state event');
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    SearchPostsByProductNameUseCase findPostsByCategoriesUseCase = SearchPostsByProductNameUseCase(postRepository);

    super.state = AsyncLoading();
    Either<Failure, List<Post>> data = await findPostsByCategoriesUseCase.excute(productName, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
          super.state = AsyncError(failure.errorMessage, failure.stackTrace);
        },
            (List<Post> posts) {

          super.state = AsyncData(posts);

        });
  }
}

class GetPostByIDEvent extends StateNotifier<AsyncValue<Post>> {
  String? userToken;
  String postID;

  GetPostByIDEvent(this.postID) : super(AsyncLoading()) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        super.state = AsyncError("Please Login Again", StackTrace.current);
      }
      else {
        getPostByIDState(postID);
      }
    });
  }
  void getPostByIDState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    GetPostByIDUseCase getPostByIDUseCase = GetPostByIDUseCase(postRepository);

    Either<Failure, Post> data = await getPostByIDUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Post post) {
      super.state = AsyncData(post);
    });
  }
}





class GetPostVotesEvent extends StateNotifier<AsyncValue<Vote>> {
  String? userToken;
  String postID;

  GetPostVotesEvent(this.postID) : super(AsyncLoading()) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        super.state = AsyncError("Please Login Again", StackTrace.current);
      }
      else {
        getPostVotesEventVotesState(postID);
      }
    });
  }

  void getPostVotesEventVotesState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    GetPostVotesUseCase getPostVotesUseCase = GetPostVotesUseCase(
        postRepository);

    Either<Failure, Vote> data = await getPostVotesUseCase.excute(
        postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Vote voteObj) {
      super.state = AsyncData(voteObj);
    });
  }
}
  class IncrementFakeVotesEvent extends StateNotifier<AsyncValue<dynamic>>{
  String? userToken;
  BuildContext context;
  IncrementFakeVotesEvent(this.context) : super(AsyncData(null)) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }
    });
  }
  void IncrementFakeVotesState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    IncrementFakeVotesUseCase incrementFakeVotesUseCase = IncrementFakeVotesUseCase(postRepository);
    super.state = AsyncLoading();
    Either<Failure, Vote> data =
    await incrementFakeVotesUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    },(Vote voteObj) {

      super.state = AsyncData(voteObj);
    });
  }
}



class IncrementOriginalVotesEvent extends StateNotifier<AsyncValue<dynamic>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  IncrementOriginalVotesEvent(this.context) : super(AsyncData(null)) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }
    });
  }
  void incrementOriginalVotesState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    IncrementOriginalVotesUseCase incrementOriginalVotesUseCase = IncrementOriginalVotesUseCase(postRepository);
    super.state = AsyncLoading();
    Either<Failure, Vote> data =
        await incrementOriginalVotesUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    },(Vote voteObj) {

      super.state = AsyncData(voteObj);
    });
  }

}



