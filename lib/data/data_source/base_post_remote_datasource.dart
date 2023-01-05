import 'package:fakebustersapp/domain/entities/post.dart';
abstract class BasePostRemoteDataSource{
  Future<String> uploadPost(Post post, String userToken);
  Future<List<Post>> findPostsByCategories(List<String> categories, String userToken);
  Future<String> incrementFakeVotes(String postID, String userToken);
  Future<String> incrementOriginalVotes(String postID, String userToken);
}



