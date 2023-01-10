import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import '../entities/uploaded_post.dart';
import '../entities/vote.dart';

abstract class BasePostRepository {
  Future<Either<Failure, UploadingPostSuccess>> uploadPost(
      UploadedPost post, String userToken);

  Future<Either<Failure, Vote>> incrementFakeVotes(
      String postID, String userToken);

  Future<Either<Failure, Vote>> incrementOriginalVotes(
      String postID, String userToken);

  Future<Either<Failure, Vote>> getPostVotes(String postID, String userToken);

  Future<Either<Failure, List<Post>>> findPostsByCategories(
      List<String> categories, String userToken);

  Future<Either<Failure, Success>> deletePost(String postID, String userToken);

  Future<Either<Failure, List<Post>>> searchPostsByProductName(
      String productName, String userToken);

  Future<Either<Failure, Post>> getPostByID(
      String postID, String userToken);
}
