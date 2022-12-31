import '../../core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyUserTokenUseCase{
  BaseUserRepository userRepository;

  VerifyUserTokenUseCase({required this.userRepository});

  Future<Either<Failure, Success>> excute(String token) async {
    return await userRepository.verifyUserToken(token);

  }


}