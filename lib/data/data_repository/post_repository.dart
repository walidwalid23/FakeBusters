import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import '../../core/exception_handling/exceptions.dart';
import '../../domain/domain_repository/base_post_repository.dart';
import '../../domain/entities/uploaded_post.dart';
import '../../domain/entities/vote.dart';
import '../data_source/base_post_remote_datasource.dart';

class PostRepository extends BasePostRepository {
  BasePostRemoteDataSource postRemoteDataSource;
  PostRepository(this.postRemoteDataSource);

  @override
  Future<Either<Failure, UploadingPostSuccess>> uploadPost(
      UploadedPost post, String userToken) async {
    try {
      UploadingPostSuccess postUploadedSuccess =
          await postRemoteDataSource.uploadPost(post, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(postUploadedSuccess);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> findPostsByCategories(
      List<String> categories, String userToken) async {
    try {
      List<Post> postsByCategories = await postRemoteDataSource
          .findPostsByCategories(categories, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(postsByCategories);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> searchPostsByProductName(
      String productName, String userToken) async {
    try {
      List<Post> postsByProductName = await postRemoteDataSource
          .searchPostsByProductName(productName, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(postsByProductName);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Vote>> getPostVotes(
      String postID, String userToken) async {
    try {
      Vote voteObject =
          await postRemoteDataSource.getPostVotes(postID, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(voteObject);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Vote>> incrementFakeVotes(
      String postID, String userToken) async {
    try {
      Vote voteObject =
          await postRemoteDataSource.incrementFakeVotes(postID, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(voteObject);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Vote>> incrementOriginalVotes(
      String postID, String userToken) async {
    try {
      Vote voteObject =
          await postRemoteDataSource.incrementOriginalVotes(postID, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(voteObject);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Success>> deletePost(
      String postID, String userToken) async {
    try {
      String incrementOriginalVotesSuccessMessage =
          await postRemoteDataSource.deletePost(postID, userToken);
      //if no exception was thrown then the method has succeeded
      return Right(
          ServerSuccess(successMessage: incrementOriginalVotesSuccessMessage));
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }
}
