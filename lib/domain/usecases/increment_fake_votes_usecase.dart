import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';


class IncrementFakeVotesUseCase{
  BasePostRepository postRepository;
  IncrementFakeVotesUseCase({required this.postRepository});

  Future<Either<Failure, Success>> excute(String postID, String userToken) async {
    return await postRepository.incrementFakeVotes(postID, userToken);

  }

}