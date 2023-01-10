import 'package:riverpod/riverpod.dart';
import '../../domain/entities/notification.dart';
import 'notification_events.dart';
import 'package:flutter/material.dart';

var userNotificationsProvider = StateNotifierProvider.autoDispose<UserNotificationsEvent,AsyncValue<List<NotificationEntity>>
>((ref) =>  UserNotificationsEvent());

final getNotificationsCountProvider = StateNotifierProvider.family<GetNotificationsCountEvent,AsyncValue<int>, BuildContext
>((ref, context) =>  GetNotificationsCountEvent(context));

