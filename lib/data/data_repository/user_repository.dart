import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/exceptions.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/data/data_source/base_user_remote_datasource.dart';
import 'package:fakebustersapp/domain/domain_repository/base_user_repository.dart';
import 'package:fakebustersapp/domain/entities/user.dart';

class UserRepository extends BaseUserRepository{
  BaseUserRemoteDataSource userRemoteDataSource;
  UserRepository({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, Success>> signUp(User user) async{
    try{
      String signedUpSuccessMessage = await userRemoteDataSource.signUp(user);
      //if no exception was thrown then the method has succeeded
      return Right(ServerSuccess(successMessage: signedUpSuccessMessage ));

    }
    on ConnectionException catch(exception, stackTrace){
      return Left(
          ConnectionFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }

    on ServerException catch(exception, stackTrace){
      return Left(
          ServerFailure(
          errorMessage:exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    }
    on GenericException catch(exception, stackTrace){
      return Left(
          GenericFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }

  }

  @override
  Future<Either<Failure, Success>> login(User user) async{
    try{
      String loggedInSuccessMessage = await userRemoteDataSource.login(user);
      //if no exception was thrown then the method has succeeded
      return Right(ServerSuccess(successMessage: loggedInSuccessMessage));

    }
    on ConnectionException catch(exception, stackTrace){
      return Left(
          ConnectionFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }

    on ServerException catch(exception, stackTrace){
      return Left(
          ServerFailure(
              errorMessage:exception.networkErrorModel.errorMessage,
              stackTrace: stackTrace));
    }
    on GenericException catch(exception, stackTrace){
      return Left(
          GenericFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }


  }

  @override
  Future<Either<Failure, Success>> verifyUserToken(String token) async{
    try{
      String tokenVerifiedSuccessMessage = await userRemoteDataSource.verifyUserToken(token);
      //if no exception was thrown then the method has succeeded
      return Right(ServerSuccess(successMessage: tokenVerifiedSuccessMessage));

    }
    on ConnectionException catch(exception, stackTrace){
      return Left(
          ConnectionFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }

    on ServerException catch(exception, stackTrace){
      return Left(
          ServerFailure(
              errorMessage:exception.networkErrorModel.errorMessage,
              stackTrace: stackTrace));
    }
    on GenericException catch(exception, stackTrace){
      return Left(
          GenericFailure(
              errorMessage:exception.errorMessage,
              stackTrace: stackTrace));
    }
  }




}