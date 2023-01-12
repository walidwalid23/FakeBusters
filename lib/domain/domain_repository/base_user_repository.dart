import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/user.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, Success>> signUp(User user);
  Future<Either<Failure, Success>> login(User user);
  Future<Either<Failure, Success>> verifyUserToken(String token);
  Future<Either<Failure, Success>> logout();
  Future<Either<Failure, Success>> EditProfile(
      Map<String, String> updatedData, String userToken);
  Future<Either<Failure, User>> getUserData(String token);
}
