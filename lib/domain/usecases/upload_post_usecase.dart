import 'package:dartz/dartz.dart';
import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../domain_repository/base_post_repository.dart';
import '../entities/post.dart';
import '../entities/uploaded_post.dart';

class UploadPostUseCase{
  BasePostRepository postRepository;
  UploadPostUseCase(this.postRepository);

  Future<Either<Failure, UploadingPostSuccess>> excute(UploadedPost post, String userToken, String notificationToken) async {

    return await postRepository.uploadPost(post, userToken, notificationToken);

  }


}

