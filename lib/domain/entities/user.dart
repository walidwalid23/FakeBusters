import 'dart:io';

class User{
  String username;
  File? profileImage;
  String password;
  int? votes;
  User({required this.username, this.profileImage, required this.password, this.votes});
}