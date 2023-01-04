import 'package:fakebustersapp/domain/entities/post.dart';
abstract class BasePostRemoteDataSource{
  Future<String> uploadPost(Post post, String userToken);
  Future<String> incrementFakeVotes(String postID);
  Future<String> incrementOriginalVotes(String postID);
}



