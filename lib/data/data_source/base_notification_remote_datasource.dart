import 'package:fakebustersapp/domain/entities/notification.dart';

abstract class BaseNotificationRemoteDataSource {
  Future<List<NotificationEntity>> getUserNotifications(String userToken);
  Future<String> deleteUserNotification(String notificationID, String userToken);
}