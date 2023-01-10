import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/domain_repository/base_user_repository.dart';



class EditProfileUseCase{
  BaseUserRepository userRepository;
  EditProfileUseCase({required this.userRepository});

  Future<Either<Failure, Success>> excute(Map<String,String> updatedData,String userToken) async {
    return await userRepository.EditProfile(updatedData,userToken);

  }

}