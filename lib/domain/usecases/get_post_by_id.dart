import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';

class GetPostByIDUseCase{
  BasePostRepository postRepository;
  GetPostByIDUseCase(this.postRepository);

  Future<Either<Failure, Post>> excute(String postID, String userToken) async {
    return await postRepository.getPostByID(postID, userToken);

  }

}