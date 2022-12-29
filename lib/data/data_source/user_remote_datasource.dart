import '../../domain/entities/user.dart';
import 'base_user_remote_datasource.dart';

class UserRemoteDataSource extends BaseUserRemoteDataSource{
  @override
  Future<bool> signUp(User user){
    throw UnimplementedError();
  }

  @override
  Future<bool> login(User user) {
    // TODO: implement login
    throw UnimplementedError();
  }
}