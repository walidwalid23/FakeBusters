import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/data/data_source/base_user_remote_datasource.dart';
import 'package:fakebustersapp/domain/usecases/signup_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/data_repository/user_repository.dart';
import '../../data/data_source/user_remote_datasource.dart';
import '../../domain/domain_repository/base_user_repository.dart';
import '../../domain/entities/user.dart';

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
      super.state = AsyncData(successMessage);
      context.go('/');
    });


  }

}