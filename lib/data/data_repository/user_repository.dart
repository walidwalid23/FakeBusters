import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/exceptions.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/data/data_source/base_user_remote_datasource.dart';
import 'package:fakebustersapp/domain/domain_repository/base_user_repository.dart';
import 'package:fakebustersapp/domain/entities/user.dart';

class UserRepository extends BaseUserRepository{
  BaseUserRemoteDataSource userRemoteDataSource;
  UserRepository({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, String>> signUp(User user) async{
    try{
      String signedUpSuccessMessage = await userRemoteDataSource.signUp(user);
      return Right(signedUpSuccessMessage);

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

  }

  @override
  Future<Either<Failure, String>> login(User user) async{
    // TODO: implement login
    throw UnimplementedError();
  }




}