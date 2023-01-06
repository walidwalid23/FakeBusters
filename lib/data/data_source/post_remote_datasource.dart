import 'package:fakebustersapp/data/models/post_model.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import '../../core/exception_handling/success.dart';
import '../../domain/entities/uploaded_post.dart';
import '../../domain/entities/vote.dart';
import '../models/vote_model.dart';
import 'base_post_remote_datasource.dart';
import 'package:dio/dio.dart';
import '../../core/exception_handling/exceptions.dart';
import 'package:fakebustersapp/core/exception_handling/network_error_model.dart';
import '../../core/utils/constants/server_manager.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class PostRemoteDataSource extends BasePostRemoteDataSource {
  @override
  Future<UploadingPostSuccess> uploadPost(
      UploadedPost post, String userToken) async {
    // send a post request to the server
    try {
      File productImage = post.productImage;
      String imageName = productImage.path.split('/').last;
      String imageExtention = path.extension(productImage.path).split('.').last;

      final imageFile = await MultipartFile.fromFile(
        productImage.path,
        filename: imageName,
        contentType: new MediaType("image", imageExtention), //important
      );

      FormData formData = FormData.fromMap({
        "postImage": imageFile,
        "productName": post.productName,
        "category": post.productCategory,
        "brandName": post.brandName
      });

      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio.post(ServerManager.baseUrl + "/posts/uploadPost",
          data: formData);

      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        return UploadingPostSuccess(
            successMessage: response.data['successMessage'],
            uploaderImage: response.data['uploaderImage'],
            uploaderUsername: response.data['uploaderUsername'],
            postID: response.data['postID']);
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error, st) {
      print(st);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<List<Post>> findPostsByCategories(
      List<String> categories, String userToken) async {
    // send a post request to the server
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio.post(
          ServerManager.baseUrl + "/posts/findPostsByCategories",
          data: {"categories": categories});

      int statusCode = response.statusCode!;
      print(response.data);
      if (statusCode == 200) {
        // return the retrieved posts on success
        List jsonPosts = response.data['posts'];
        List<Post> posts = jsonPosts.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      print(error);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<List<Post>> findPostsByProductName(
      String productName, String userToken) async {
    // send a post request to the server
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio.post(
          ServerManager.baseUrl + "/posts/findPostsByProductName",
          data: {"ProductName": productName});

      int statusCode = response.statusCode!;
      print(response.data);
      if (statusCode == 200) {
        // return the retrieved posts on success
        List jsonPosts = response.data['posts'];
        List<Post> posts = jsonPosts.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      print(error);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<Vote> getPostVotes(String postID, String userToken) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio
          .get(ServerManager.baseUrl + "/posts/getVotes?postID=$postID");

      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        return VoteModel.fromJson(response.data);
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      print(error);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<Vote> incrementFakeVotes(String postID, String userToken) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio
          .post(ServerManager.baseUrl + "/posts/incrementFakeVotes", data: {
        "postID": postID,
      });

      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        return VoteModel.fromJson(response.data);
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      print(error);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<Vote> incrementOriginalVotes(String postID, String userToken) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio
          .post(ServerManager.baseUrl + "/posts/incrementOriginalVotes", data: {
        "postID": postID,
      });

      print(response);

      int statusCode = response.statusCode!;

      if (statusCode == 200) {
        return VoteModel.fromJson(response.data);
      }
      // since the server didn't return 200 then there must have been a problem
      else {
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(response.data));
      }
    }
    // CATCHING THE DIO EXCEPTIONS AND THROWING OUR CUSTOM EXCEPTIONS
    on DioError catch (e) {
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      print(error);
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }

  @override
  Future<String> deletePost(String postID, String userToken) async {
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response =
          await dio.post(ServerManager.baseUrl + "/posts/uploadPost", data: {
        "postID": postID,
      });

      int statusCode = response.statusCode!;

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
      if ((e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout)) {
        // handle no connection error
        throw ConnectionException(errorMessage: "No Internet Connection");
      }
      // this condition applies if status code falls out of the range of 2xx and is also not 304.
      //WE ALREADY HANDLED THIS ABOVE BUT WE MUST HANDLE IT THROW DIO AS WELL CAUSE IT THROWS IT
      else if (e.response != null) {
        //this is the same data as response.data
        print(e.response!.data);
        throw ServerException(
            networkErrorModel: NetworkErrorModel.fromJson(e.response!.data));
      } else {
        // rethrow the exception again cause you didn't handle it (nothing happens when its rethrown till you handle it)
        // rethrow;
        // OR CREATE A GENERIC ERROR MESSAGE
        throw GenericException(errorMessage: "Unknown Exception Has Occurred");
      }
    } catch (error) {
      // CATCH ANY OTHER LEFT EXCEPTION
      throw GenericException(errorMessage: "Unknown Exception Has Occurred");
    }
  }
}
