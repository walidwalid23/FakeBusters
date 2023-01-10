import 'package:dartz/dartz.dart';
import 'package:fakebustersapp/core/exception_handling/failures.dart';
import 'package:fakebustersapp/core/exception_handling/success.dart';
import 'package:fakebustersapp/domain/domain_repository/base_notification_repository.dart';
import 'package:fakebustersapp/domain/entities/notification.dart';

import '../../core/exception_handling/exceptions.dart';
import '../data_source/base_notification_remote_datasource.dart';

class NotificationRepository extends BaseNotificationRepository{
  BaseNotificationRemoteDataSource notificationRemoteDataSource;
  NotificationRepository(this.notificationRemoteDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getUserNotifications(String userToken) async{
    try {
      List<NotificationEntity> notifications = await notificationRemoteDataSource.getUserNotifications(userToken);
      //if no exception was thrown then the method has succeeded
      return Right(notifications);
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }



  @override
  Future<Either<Failure, Success>> deleteUserNotification(String notificationID, String userToken) async{
    try {
      String deleteSuccessMessage = await notificationRemoteDataSource.deleteUserNotification(notificationID,userToken);
      //if no exception was thrown then the method has succeeded
      return Right(ServerSuccess(successMessage:deleteSuccessMessage ));
    } on ConnectionException catch (exception, stackTrace) {
      return Left(ConnectionFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    } on ServerException catch (exception, stackTrace) {
      return Left(ServerFailure(
          errorMessage: exception.networkErrorModel.errorMessage,
          stackTrace: stackTrace));
    } on GenericException catch (exception, stackTrace) {
      return Left(GenericFailure(
          errorMessage: exception.errorMessage, stackTrace: stackTrace));
    }
  }



}