import 'package:fakebustersapp/domain/entities/notification.dart';

class NotificationModel extends NotificationEntity{
  NotificationModel({required super.notificationText,required super.notificationID ,required super.notificationDate, required super.postID});

  factory NotificationModel.fromJson(Map jsonNotification){

    return NotificationModel(
      notificationText: jsonNotification['notificationText'],
      notificationDate: jsonNotification['notificationDate'],
      postID: jsonNotification['postID'],
      notificationID: jsonNotification['_id']
    );
  }

}