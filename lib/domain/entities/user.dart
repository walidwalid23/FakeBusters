import 'dart:io';

class User{
  String username;
  File? profileImage;
  String password;
  User({required this.username, this.profileImage, required this.password});
}