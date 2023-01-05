import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';

class FindPostsByCategoriesUseCase{
  BasePostRepository postRepository;
  FindPostsByCategoriesUseCase(this.postRepository);

  Future<Either<Failure, List<Post>>> excute(List<String> categories, String userToken) async {
    return await postRepository.findPostsByCategories(categories, userToken);

  }

}