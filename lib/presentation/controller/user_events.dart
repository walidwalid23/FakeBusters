import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/data/data_source/base_user_remote_datasource.dart';
import 'package:fakebustersapp/domain/usecases/signup_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../data/data_repository/user_repository.dart';
import '../../data/data_source/user_remote_datasource.dart';
import '../../domain/domain_repository/base_user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

class UserSignUpEvent extends StateNotifier <AsyncValue<dynamic>>{
  // the initial state will be null cause nothing should be shown till the sign up button is clicked
  UserSignUpEvent(): super( AsyncData(null) );

  void signupState(BuildContext context, User user) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource: userRemoteDataSource);
    SignUpUseCase signupUseCase = SignUpUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, String> data = await signupUseCase.excute(user);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    } , (String successMessage) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg: successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb:3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
      );
      context.push('/');
    });

  }
}

class UserLoginEvent extends StateNotifier <AsyncValue<dynamic>>{
  // the initial state will be null cause nothing should be shown till the login button is clicked
  UserLoginEvent(): super( AsyncData(null) );

  void loginState(BuildContext context, User user) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource: userRemoteDataSource);
    LoginUseCase loginUseCase = LoginUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, String> data = await loginUseCase.excute(user);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    } , (String successMessage) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show logged in alert
      Fluttertoast.showToast(
          msg: successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb:3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
      );
      context.push('/search');
     // context.push('/');
    });


  }

}