import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakebustersapp/domain/entities/notification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/exception_handling/failures.dart';
import '../../data/data_repository/notification_repository.dart';
import '../../data/data_source/base_notification_remote_datasource.dart';
import '../../data/data_source/notification_remote_datasource.dart';
import '../../domain/domain_repository/base_notification_repository.dart';
import '../../domain/usecases/get_user_notifications_usecase.dart';

class GetUserNotificationsEvent extends StateNotifier<AsyncValue<List<NotificationEntity>>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  GetUserNotificationsEvent(this.context) : super(AsyncLoading()) {
    print("in provider constructor");
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }

      else{
        // update the state with the posts
        getUserNotificationsState();
      }

    });
  }

  void getUserNotificationsState() async {
    print('in the state event');
    BaseNotificationRemoteDataSource notificationRemoteDataSource = NotificationRemoteDataSource();
    BaseNotificationRepository notificationRepository = NotificationRepository(notificationRemoteDataSource);
    GetUserNotificationsUseCase getUserNotificationsUseCase = GetUserNotificationsUseCase(notificationRepository);

    Either<Failure, List<NotificationEntity>> data =
    await getUserNotificationsUseCase.excute(userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
          super.state = AsyncError(failure.errorMessage, failure.stackTrace);
        },
            (List<NotificationEntity> notifications) {

          super.state = AsyncData(notifications);

        });
  }
}

class GetNotificationsCountEvent extends StateNotifier<AsyncValue<int>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  BuildContext context;
  GetNotificationsCountEvent(this.context) : super(AsyncLoading()) {
    print("in provider constructor");
    SharedPreferences.getInstance().then((prefs) {
      userToken = prefs.getString('userToken');
      // if the token doesn't exist move to login page without sending a request to the server
      if (userToken == null) {
        Fluttertoast.showToast(
            msg: "Please Login Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16);
        context.go('/login');
      }

      else{
        // update the state with the posts
        getUserNotificationsState();
      }

    });
  }

  void getUserNotificationsState() async {
    print('in the state event');
    BaseNotificationRemoteDataSource notificationRemoteDataSource = NotificationRemoteDataSource();
    BaseNotificationRepository notificationRepository = NotificationRepository(notificationRemoteDataSource);
    GetUserNotificationsUseCase getUserNotificationsUseCase = GetUserNotificationsUseCase(notificationRepository);

    Either<Failure, List<NotificationEntity>> data =
    await getUserNotificationsUseCase.excute(userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
          super.state = AsyncError(failure.errorMessage, failure.stackTrace);
        },
            (List<NotificationEntity> notifications) {

          super.state = AsyncData(notifications.length);

        });
  }
}