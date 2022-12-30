import '../../core/exception_handling/failures.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';

class LoginUseCase{
  BaseUserRepository userRepository;
  LoginUseCase({required this.userRepository});

  Future<Either<Failure, String>> excute(User user) async {
    return await userRepository.login(user);

  }

}