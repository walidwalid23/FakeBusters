import 'package:dartz/dartz.dart';

import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../entities/notification.dart';
import 'package:fakebustersapp/domain/domain_repository/base_notification_repository.dart';

class DeleteUserNotificationUseCase{
  BaseNotificationRepository notificationRepository;
  DeleteUserNotificationUseCase(this.notificationRepository);

  Future<Either<Failure,Success>> excute(String notificationID,String userToken) async {
    return await notificationRepository.deleteUserNotification(notificationID, userToken);

  }
}