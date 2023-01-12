import '../../core/exception_handling/failures.dart';
import '../domain_repository/base_user_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/user.dart';

class GetUserDataUseCase{
  BaseUserRepository userRepository;
  GetUserDataUseCase({required this.userRepository});

  Future<Either<Failure, User>> excute(String userToken) async {
    return await userRepository.getUserData(userToken);

  }

}