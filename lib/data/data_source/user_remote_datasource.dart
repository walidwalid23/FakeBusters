import 'package:fakebustersapp/core/exception_handling/network_error_model.dart';
import '../../core/exception_handling/exceptions.dart';
import '../../domain/entities/user.dart';
import 'base_user_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSource extends BaseUserRemoteDataSource{
  @override
  Future<bool> signUp(User user) async{
    // IF THE USER DIDN'T UPLOAD IGNORE IT AND THE SERVER WILL PUT A DEFAULT IMAGE
    FormData formData;

   if(user.profileImage!=null){
     File profileImage = user.profileImage!;
     String imageName = profileImage.path.split('/').last;
     String imageExtention = path.extension(profileImage.path).split('.').last;
     final imageFile = await MultipartFile.fromFile(
       profileImage.path,
       filename: imageName,
       contentType: new MediaType("image", imageExtention), //important
     );

       formData = FormData.fromMap({
       "profileImage":imageFile ,
       "username":user.username,
       "password":user.password

     });

   }
   else{
       formData = FormData.fromMap({
       "username":user.username,
       "password":user.password

     });
    }
   // send a post request to the server
    Dio dio = new Dio();
    var response = await dio.post("http://192.168.1.3/users/signup", data: formData);
    int statusCode = response.statusCode!;
    print(response.headers);
    print(response.headers['user-token']![0]);
    print(response.data);

   // The User Have Signed Up Successfully Now Store His JWT Token Locally
    if(statusCode == 200){
      String userToken = response.headers['user-token']![0];
      // store the user token using sharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userToken', userToken);

      return true;

    }

    // since the server didn't return 200 then there must have been a problem
    else{

      throw ServerException(networkErrorModel: NetworkErrorModel.fromJson(response.data));

    }


  }



  @override
  Future<bool> login(User user) {
    // TODO: implement login
    throw UnimplementedError();
  }
}