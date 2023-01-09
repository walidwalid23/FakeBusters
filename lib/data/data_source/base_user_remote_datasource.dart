import 'package:fakebustersapp/domain/entities/updateuser.dart';
import '../../domain/entities/user.dart';

abstract class BaseUserRemoteDataSource{
  Future<String> signUp(User user);
  Future<String> login(User user);
  Future<String> verifyUserToken(String token);
  Future<String> EditProfile(List<Map<String,String>> updated_data,String token);

}