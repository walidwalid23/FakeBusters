import '../../domain/entities/user.dart';

class UserModel extends User{
  UserModel({required super.username,  super.password, required super.votes, required super.profileImage});

  factory UserModel.fromJson(Map json){
    return UserModel(username: json["username"], votes:json["userVotes"],
        profileImage:json["profileImage"]);
  }


}