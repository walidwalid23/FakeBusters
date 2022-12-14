import 'package:dartz/dartz.dart';
import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../domain_repository/base_post_repository.dart';
import '../entities/vote.dart';



class IncrementOriginalVotesUseCase{
  BasePostRepository postRepository;
  IncrementOriginalVotesUseCase(this.postRepository);

  Future<Either<Failure, Vote>> excute(String postID, String userToken) async {
    return await postRepository.incrementOriginalVotes(postID, userToken);

  }

}
