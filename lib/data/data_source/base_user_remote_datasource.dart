import '../../domain/entities/user.dart';

abstract class BaseUserRemoteDataSource{
  Future<bool> signUp(User user);
  Future<bool>  login(User user);
}