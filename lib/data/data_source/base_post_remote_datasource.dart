import 'package:fakebustersapp/domain/entities/post.dart';

import '../../domain/entities/vote.dart';
abstract class BasePostRemoteDataSource{
  Future<String> uploadPost(Post post, String userToken);
  Future<List<Post>> findPostsByCategories(List<String> categories, String userToken);
  Future<Vote> incrementFakeVotes(String postID, String userToken);
  Future<String> incrementOriginalVotes(String postID, String userToken);
  Future<String> deletePost(String postID, String userToken);
}



