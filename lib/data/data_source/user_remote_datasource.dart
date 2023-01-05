import 'package:fakebustersapp/core/exception_handling/network_error_model.dart';
import '../../core/exception_handling/exceptions.dart';
import '../../core/utils/constants/server_manager.dart';
import '../../domain/entities/user.dart';
import 'base_user_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSource extends BaseUserRemoteDataSource{
  @override
  Future<String> signUp(User user) async {
    // IF THE USER DIDN'T UPLOAD IGNORE IT AND THE SERVER WILL PUT A DEFAULT IMAGE
    FormData formData;
    if (user.profileImage != null) {
      File profileImage = user.profileImage!;
      String imageName = profileImage.path.split('/').last;
      String imageExtention = path.extension(profileImage.path).split('.').last;

      final imageFile = await MultipartFile.fromFile(
        profileImage.path,
        filename: imageName,
        contentType: new MediaType("image", imageExtention), //important
      );

      formData = FormData.fromMap({
        "profileImage": imageFile,
        "username": user.username,
        "password": user.password
      });
    }
    else {
      formData = FormData.fromMap({
        "username": user.username,
        "password": user.password
      });
    }
    // send a post request to the server
    try {
      Dio dio = new Dio();
      var response = await dio.post(ServerManager.baseUrl + "/users/signup", data: formData);
      int statusCode = response.statusCode!;


      // The User Have Signed Up Successfully Now Store His JWT Token Locally
      if (statusCode == 200) {
        String userToken = response.headers['user-token']![0];
        // store the user token using sharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', userToken);

        return response.data['successMessage'];
      }

      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout)) {
        // handle couldn't connect to server error (it has nothing to do with the internet being available)
        throw ConnectionException(errorMessage:"Couldn't Connect to the Server");
      }
      // status code that falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      }
      else{
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        //rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage:"Unknown Exception Has Occurred");
    }

      }
    catch(error){
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage:"Unknown Exception Has Occurred");
    }
  }



  @override
  Future<String> login(User user) async{
    // send a post request to the server
    try {
      Dio dio = new Dio();
      var response = await dio.post(ServerManager.baseUrl+ "/users/login", data: {
        "username": user.username,
        "password": user.password
      });

      int statusCode = response.statusCode!;

      // The User Have Signed Up Successfully Now Store His JWT Token Locally
      if (statusCode == 200) {
        String userToken = response.headers['user-token']![0];
        // store the user token using sharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userToken', userToken);
          print(response.data['successMessage']);
        return response.data['successMessage'];
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage:"No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      }
      else{
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
       // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage:"Unknown Exception Has Occurred");

      }
    }
    catch(error){
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage:"Unknown Exception Has Occurred");
    }
  }

  @override
  Future<String> verifyUserToken(String token) async{

    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = token;
      var response = await dio.post(ServerManager.baseUrl+ "/users/verifyUserToken");

      int statusCode = response.statusCode!;

      // The token has been successfully verified
      if (statusCode == 200) {
        return response.data['successMessage'];
      }

      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage:"No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      }
      else{
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage:"Unknown Exception Has Occurred");
      }

    }
    catch(error){
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage:"Unknown Exception Has Occurred");
    }
  }

  @override
  Future<String> EditProfile(User user) async {
    try {
      Dio dio = new Dio();

      var response = await dio.post(ServerManager.baseUrl+ "/users/login", data: {
        "username": user.username,
        "password": user.password
      });
      int statusCode = response.statusCode!;

      // The token has been successfully verified
      if (statusCode == 200) {
        return response.data['successMessage'];
      }

      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage:"No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      }
      else{
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage:"Unknown Exception Has Occurred");
      }

    }
    catch(error){
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage:"Unknown Exception Has Occurred");
    }
  }
}