import 'package:fakebustersapp/domain/entities/post.dart';
abstract class BasePostRemoteDataSource{
  Future<String> uploadPost(Post post, String userToken);
}



