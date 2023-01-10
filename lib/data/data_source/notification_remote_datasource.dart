import 'package:dio/dio.dart';
import 'package:fakebustersapp/data/data_source/base_notification_remote_datasource.dart';
import 'package:fakebustersapp/domain/entities/notification.dart';

import '../../core/exception_handling/exceptions.dart';
import '../../core/exception_handling/network_error_model.dart';
import '../../core/utils/constants/server_manager.dart';
import '../models/notification_model.dart';

class NotificationRemoteDataSource extends BaseNotificationRemoteDataSource{


  @override
  Future<List<NotificationEntity>> getUserNotifications(String userToken) async{

    // send a get request to the server
    try {
      Dio dio = new Dio();
      dio.options.headers['user-token'] = userToken;
      var response = await dio.get(
          ServerManager.baseUrl + "/notifications/getNotifications");

      int statusCode = response.statusCode!;
      print(response.data);
      if (statusCode == 200) {
        // return the retrieved posts on success
        List jsonNotifications = response.data['notifications'];
        List<NotificationModel> posts = jsonNotifications.map((e) => NotificationModel.fromJson(e)).toList();
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
  Future<String> deleteUserNotification(String notificationID, String userToken) {
    // TODO: implement deleteUserNotification
    throw UnimplementedError();
  }



}