import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/domain_repository/base_post_repository.dart';
import 'package:fakebustersapp/domain/domain_repository/base_user_repository.dart';
import 'package:fakebustersapp/domain/entities/updateuser.dart';
import 'package:fakebustersapp/domain/entities/user.dart';
import '../entities/vote.dart';


class EditProfileUsecase{
  BaseUserRepository userRepository;
  EditProfileUsecase({required this.userRepository});

  Future<Either<Failure, Success>> excute(List<String> user,String userToken) async {
    return await userRepository.EditProfile(user,userToken);

  }

}