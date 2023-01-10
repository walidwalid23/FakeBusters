import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/entities/notification.dart';

abstract class BaseNotificationRepository{
  Future<Either<Failure, List<NotificationEntity>>> getUserNotifications(String userToken);
  Future<Either<Failure, Success>> deleteUserNotification(String notificationID, String userToken);


}