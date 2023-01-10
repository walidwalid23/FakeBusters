import 'package:dartz/dartz.dart';

import '../../core/exception_handling/failures.dart';
import '../entities/notification.dart';
import 'package:fakebustersapp/domain/domain_repository/base_notification_repository.dart';

class GetUserNotificationsUseCase{
  BaseNotificationRepository notificationRepository;
  GetUserNotificationsUseCase(this.notificationRepository);

  Future<Either<Failure, List<NotificationEntity>>> excute(String userToken) async {
    return await notificationRepository.getUserNotifications(userToken);

  }
}