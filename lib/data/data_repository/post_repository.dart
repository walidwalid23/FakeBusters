import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import '../../core/exception_handling/exceptions.dart';
import '../../domain/domain_repository/base_post_repository.dart';
import '../data_source/base_post_remote_datasource.dart';

class PostRepository extends BasePostRepository{
  BasePostRemoteDataSource postRemoteDataSource;
  PostRepository(this.postRemoteDataSource);


  @override
  Future<Either<Failure, Success>> uploadPost(Post post, String userToken) async{
    try{
      String postUploadedSuccessMessage = await postRemoteDataSource.uploadPost(post, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(ServerSuccess(successMessage: postUploadedSuccessMessage ));

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
  Future<Either<Failure, Success>> incrementFakeVotes(String postID, String userToken) {
    // TODO: implement incrementFakeVotes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> incrementOriginalVotes(String postID, String userToken) {
    // TODO: implement incrementOriginalVotes
    
    throw UnimplementedError();
  }
}