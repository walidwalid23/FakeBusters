import 'package:fakebustersapp/domain/entities/post.dart';

import '../../core/exception_handling/success.dart';
import '../../domain/entities/uploaded_post.dart';
import '../../domain/entities/vote.dart';

abstract class BasePostRemoteDataSource {
  Future<UploadingPostSuccess> uploadPost(UploadedPost post, String userToken, String notificationToken);
  Future<List<Post>> findPostsByCategories(
      List<String> categories, String userToken);
  Future<List<Post>> searchPostsByProductName(
      String productName, String userToken);
  Future<Vote> incrementFakeVotes(String postID, String userToken);
  Future<Vote> incrementOriginalVotes(String postID, String userToken);
  Future<Vote> getPostVotes(String postID, String userToken);
  Future<String> deletePostByID(String postID, String userToken);
  Future<Post> getPostByID(String postID, String userToken);
}
