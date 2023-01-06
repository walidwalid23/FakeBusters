import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';

class SearchPostsByProductNameUseCase {
  BasePostRepository postRepository;
  SearchPostsByProductNameUseCase(this.postRepository);

  Future<Either<Failure, List<Post>>> excute(
      String productName, String userToken) async {
    return await postRepository.findPostsByProductName(productName, userToken);
  }
}
