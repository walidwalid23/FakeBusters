import '../../domain/entities/vote.dart';

class VoteModel extends Vote{
  VoteModel({required super.fakeVotes, required super.originalVotes});

  factory VoteModel.fromJson(Map json){
    return VoteModel(fakeVotes: json["fakeVotes"], originalVotes: json["originalVotes"]);
  }
}