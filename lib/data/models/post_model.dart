import 'package:fakebustersapp/domain/entities/post.dart';

class PostModel extends Post{
  PostModel({required super.productName, required super.brandName,
    required super.productCategory, required super.productImage,  super.postDate});

  factory PostModel.fromJson(Map jsonPost){

    return PostModel(productName: jsonPost["productName"], brandName: jsonPost["brandName"]
        , productCategory:jsonPost["category"], productImage: jsonPost['postImage'],
          postDate: jsonPost["postDate"]);
  }

}