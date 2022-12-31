import '../../core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';

class LoginUseCase{
  BaseUserRepository userRepository;
  LoginUseCase({required this.userRepository});

  Future<Either<Failure, Success>> excute(User user) async {
    return await userRepository.login(user);

  }

}