import 'dart:io';

class User{
  String username;
  dynamic profileImage;
  String? password;
  int? votes;
  User({required this.username, this.profileImage, this.password, this.votes});
}