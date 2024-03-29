import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fakebustersapp/domain/entities/notification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/exception_handling/failures.dart';
import '../../core/exception_handling/success.dart';
import '../../data/data_repository/notification_repository.dart';
import '../../data/data_source/base_notification_remote_datasource.dart';
import '../../data/data_source/notification_remote_datasource.dart';
import '../../domain/domain_repository/base_notification_repository.dart';
import '../../domain/usecases/delete_user_notification.dart';
import '../../domain/usecases/get_user_notifications_usecase.dart';
import 'notification_providers.dart';

class UserNotificationsEvent extends StateNotifier<AsyncValue<List<NotificationEntity>>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;

  UserNotificationsEvent() : super(AsyncLoading()) {
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

      }

      else{
        // update the state with the posts
        getUserNotificationsState();

      }

    });

  }

  void getUserNotificationsState() async {
    final prefs = await SharedPreferences.getInstance();
    String? theUserToken = prefs.getString('userToken');
    print('in the state event');
    BaseNotificationRemoteDataSource notificationRemoteDataSource = NotificationRemoteDataSource();
    BaseNotificationRepository notificationRepository = NotificationRepository(notificationRemoteDataSource);
    GetUserNotificationsUseCase getUserNotificationsUseCase = GetUserNotificationsUseCase(notificationRepository);
    state = AsyncLoading();
    print("token:");
    print(theUserToken);
    Either<Failure, List<NotificationEntity>> data =
    await getUserNotificationsUseCase.excute(theUserToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold(
            (Failure failure) {
          state = AsyncError(failure.errorMessage, failure.stackTrace);
        },
            (List<NotificationEntity> notifications) {

          state = AsyncData(notifications);

        });
  }

  void deleteUserNotificationState(String notificationID) async {
    BaseNotificationRemoteDataSource notificationRemoteDataSource = NotificationRemoteDataSource();
    BaseNotificationRepository notificationRepository = NotificationRepository(notificationRemoteDataSource);
    DeleteUserNotificationUseCase deleteUserNotificationUseCase = DeleteUserNotificationUseCase(notificationRepository);


    // get the user token again since this function isn't called in sharedPrefs.then()
    final prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString('userToken');

    Either<Failure, Success> data =
    await deleteUserNotificationUseCase.excute(notificationID, userToken!);
    // USE .FOLD METHOD IN THE SCREENS LAYER TO DEAL WITH THE EITHER DATA
    data.fold((Failure failure) {
      state = AsyncError(failure.errorMessage, failure.stackTrace);
    }, (Success success) async{
      // IF THE NOTIFICATION IS DELETED GET THE NEW NOTIFICATIONS LIST AND UPDATE THE STATE
      // YOU DON'T NEED TO REQUEST TO THE BACKEND AGAIN SINCE YOU ARE SURE THE DELETE WAS SUCCESS
      // SO DELETE FROM THE CURRENT LIST (STATE) DIRECTLY
      print(state.value);
      List<NotificationEntity> notifications = state.value!; // = ASYNCDATA(value).value
     notifications.removeWhere((notification) => notification.notificationID == notificationID);
      print("notifications:");
      print(notifications);
      state = AsyncData(notifications);




    });
  }
}

class GetNotificationsCountEvent extends StateNotifier<AsyncValue<int>> {
  // the initial state will be null cause nothing should be shown till the submit button is clicked
  String? userToken;
  WidgetRef widgetRef;
  GetNotificationsCountEvent(this.widgetRef) : super(AsyncLoading()) {
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

      }

      else{
        // update the state with the posts
        getUserNotificationsCountState();
        // update the state of the notifications in the notifications page with the new added notifications
        widgetRef.read(userNotificationsProvider.notifier).getUserNotificationsState();
      }

    });
  }

  void getUserNotificationsCountState() async {
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









