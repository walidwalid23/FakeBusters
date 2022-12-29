import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/domain/entities/user.dart';
abstract class BaseUserRepository{
  String signUp(User user);
  String login(User user);

}