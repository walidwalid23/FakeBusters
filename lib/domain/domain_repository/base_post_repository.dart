import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/post.dart';

abstract class BasePostRepository{
   Future<Either<Failure, Success>> uploadPost(Post post, String userToken);
   Future<Either<Failure, Success>> incrementFakeVotes(String postID, String userToken);
   Future<Either<Failure, Success>> incrementOriginalVotes(String postID, String userToken);
   Future<Either<Failure, List<Post>>> findPostsByCategories(List<String> categories, String userToken);


}