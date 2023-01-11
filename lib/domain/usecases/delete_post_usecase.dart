import 'package:dartz/dartz.dart';
import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../domain_repository/base_post_repository.dart';



class DeletePostByIDUseCase{
  BasePostRepository postRepository;
  DeletePostByIDUseCase( this.postRepository);

  Future<Either<Failure, Success>> excute(String postID, String userToken) async {
    
    return await postRepository.deletePostByID(postID, userToken);

  }

}