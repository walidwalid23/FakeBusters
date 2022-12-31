import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/data/data_source/base_user_remote_datasource.dart';
import 'package:fakebustersapp/domain/usecases/signup_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/data_repository/user_repository.dart';
import '../../data/data_source/base_user_local_datasource.dart';
import '../../data/data_source/user_local_datasource.dart';
import '../../data/data_source/user_remote_datasource.dart';
import '../../domain/domain_repository/base_user_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/verify_user_token_usecase.dart';

class UserSignUpEvent extends StateNotifier <AsyncValue<dynamic>>{
  // the initial state will be null cause nothing should be shown till the sign up button is clicked
  UserSignUpEvent(): super( AsyncData(null) );

  void signupState(BuildContext context, User user) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserLocalDataSource userLocalDataSource = UserLocalDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource, userLocalDataSource);
    SignUpUseCase signupUseCase = SignUpUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data = await signupUseCase.excute(user);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    } , (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show signed up alert
      Fluttertoast.showToast(
          msg:  success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb:3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
      );
      context.push('/home');
    });

  }
}

class UserLoginEvent extends StateNotifier <AsyncValue<dynamic>>{
  // the initial state will be null cause nothing should be shown till the login button is clicked
  UserLoginEvent(): super( AsyncData(null) );

  void loginState(BuildContext context, User user) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserLocalDataSource userLocalDataSource = UserLocalDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource, userLocalDataSource);
    LoginUseCase loginUseCase = LoginUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data = await loginUseCase.excute(user);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    } , (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show logged in alert
      Fluttertoast.showToast(
          msg:  success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb:3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
      );
      context.push('/home');

    });
  }
}

class verifyUserTokenEvent extends StateNotifier <AsyncValue<dynamic>>{

  verifyUserTokenEvent(BuildContext context): super( AsyncLoading() ) {
    // get the stored token
    SharedPreferences.getInstance().then((prefs) {
      final String? token = prefs.getString('userToken');
      // if the token exists send it to the server
      if(token!=null){ verifyUserTokenState(context, token);}
      else{
        // if the token doesn't exist move to login page without sending a request to the server
        context.push('/login');
      }

    }
    );

  }

  void verifyUserTokenState(BuildContext context, String token) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserLocalDataSource userLocalDataSource = UserLocalDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource, userLocalDataSource);
    VerifyUserTokenUseCase  verifyUserTokenUseCase =  VerifyUserTokenUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data = await verifyUserTokenUseCase.excute(token);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      // GO TO LOGIN PAGE IF THE TOKEN REQUEST WAS A FAILURE FOR ANY REASON
      context.push('/login');
    } , (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page since the token is verified
      context.push('/home');

    });


  }

}

class UserLogoutEvent extends StateNotifier <AsyncValue<dynamic>>{
  // the initial state will be null cause nothing should be shown till the login button is clicked
  UserLogoutEvent(): super( AsyncData(null) );

  void logoutState(BuildContext context) async{
    BaseUserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();
    BaseUserLocalDataSource userLocalDataSource = UserLocalDataSource();
    BaseUserRepository userRepository  = UserRepository(userRemoteDataSource, userLocalDataSource);
    LogoutUseCase logoutUseCase = LogoutUseCase(userRepository: userRepository);

    super.state = AsyncLoading();
    Either<Failure, Success> data = await logoutUseCase.excute();
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      super.state = AsyncError(failure.errorMessage, failure.stackTrace);
    } , (Success success) {
      //we don't need to change the state when succeed cause we will move to another screen
      // but we set it to null to stop loading in case the user went to previous screen
      super.state = AsyncData(null);
      // go to home page and show logged in alert
      Fluttertoast.showToast(
          msg:  success.successMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb:3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16
      );
      // we don't want the user to return to home again after logging out so we use .go
      context.go('/login');

    });


  }

}
