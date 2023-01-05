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
import '../../domain/usecases/upload_post_usecase.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import '../../domain/usecases/delete_post_usecase.dart';

class UploadPostEvent extends StateNotifier<AsyncValue<dynamic>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  UploadPostEvent(this.context) : super(AsyncData(null)) {
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
        context.push('/login');
      }
    });
  }

  void uploadPostState(Post post) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    UploadPostUseCase uploadPostUseCase = UploadPostUseCase(postRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data =
        await uploadPostUseCase.excute(post, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg: success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      context.push('/displaypost', extra: post);
    });
  }
}
class IncrementFakeVotesEvent extends StateNotifier<AsyncValue<dynamic>>{
  String? userToken;
  BuildContext context;
  IncrementFakeVotesEvent (this.context): super( AsyncData(null) ) {

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
            msg: "Please Vote Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.push('/login');
      }
    });
  }
  void incrementOriginalVotesState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    IncrementOriginalVotesUseCase incrementOriginalVotesUseCase = IncrementOriginalVotesUseCase(postRepository);
    super.state = AsyncLoading();
    Either<Failure, Success> data =
        await incrementOriginalVotesUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg: success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      context.push('/displaypost', extra: postID);
    });
  }



}
class DeletePostEvent extends StateNotifier<AsyncValue<dynamic>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  DeletePostEvent(this.context) : super(AsyncData(null)) {
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Delete Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.push('/login');
      }
    });
  }

  void deletePostState(String postID) async {
    BasePostRemoteDataSource postRemoteDataSource = PostRemoteDataSource();
    BasePostRepository postRepository = PostRepository(postRemoteDataSource);
    DeletePostUseCase deletePostUseCase = DeletePostUseCase(postRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data =
        await deletePostUseCase.excute(postID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg: success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
      context.push('/displaypost', extra: postID);
    });
  }
}