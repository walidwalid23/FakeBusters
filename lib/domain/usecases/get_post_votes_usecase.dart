import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';
import '../entities/vote.dart';
class GetPostVotesUseCase{
  BasePostRepository postRepository;
  GetPostVotesUseCase(this.postRepository);

  Future<Either<Failure, Vote>> excute(String postID, String userToken) async {
    return await postRepository.getPostVotes(postID, userToken);

  }

}