import 'package:fakebustersapp/domain/entities/updateuser.dart';
import '../../domain/entities/user.dart';

abstract class BaseUserRemoteDataSource{
  Future<String> signUp(User user);
  Future<String> login(User user);
  Future<String> verifyUserToken(String token);
  Future<String> EditProfile(Map<String,String> user,String token);

}