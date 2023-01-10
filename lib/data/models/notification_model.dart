import 'package:fakebustersapp/domain/entities/notification.dart';

class NotificationModel extends NotificationEntity{
  NotificationModel({required super.notificationText, required super.notificationDate, required super.postID});

  factory NotificationModel.fromJson(Map jsonPost){

    return NotificationModel(
      notificationText: jsonPost['notificationText'],
      notificationDate: jsonPost['notificationDate'],
      postID: jsonPost['postID']

    );
  }

}