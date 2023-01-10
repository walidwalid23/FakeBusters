import 'package:riverpod/riverpod.dart';
import '../../domain/entities/notification.dart';
import 'notification_events.dart';
import 'package:flutter/material.dart';

final getUserNotificationsProvider = StateNotifierProvider.family<GetUserNotificationsEvent,AsyncValue<List<NotificationEntity>>, BuildContext
>((ref, context) =>  GetUserNotificationsEvent(context));

final getNotificationsCountProvider = StateNotifierProvider.family<GetNotificationsCountEvent,AsyncValue<int>, BuildContext
>((ref, context) =>  GetNotificationsCountEvent(context));