import 'package:dartz/dartz.dart';
import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../domain_repository/base_post_repository.dart';



class DeletePostUseCase{
  BasePostRepository postRepository;
  DeletePostUseCase( this.postRepository);

  Future<Either<Failure, Success>> excute(String postID, String userToken) async {
    
    return await postRepository.deletePost(postID, userToken);

  }

}