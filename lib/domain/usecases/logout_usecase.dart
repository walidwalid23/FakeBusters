import '../../core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';

class LogoutUseCase{
  BaseUserRepository userRepository;
  LogoutUseCase({required this.userRepository});

  Future<Either<Failure, Success>> excute() async {
    return await userRepository.logout();

  }

}