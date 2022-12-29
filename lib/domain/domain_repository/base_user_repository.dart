import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/domain/entities/user.dart';
abstract class BaseUserRepository{
  Future<Either<Failure, bool>> signUp(User user);
  Future<Either<Failure, bool>> login(User user);

}