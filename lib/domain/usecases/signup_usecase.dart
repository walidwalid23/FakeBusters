import '../../core/exception_handling/failures.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';

class SignUpUseCase{
  BaseUserRepository userRepository;
  SignUpUseCase({required this.userRepository});

  Future<Either<Failure, String>> excute(User user) async {
    return await userRepository.signUp(user);

  }

}