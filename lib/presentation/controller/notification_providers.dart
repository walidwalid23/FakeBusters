import 'package:riverpod/riverpod.dart';
import '../../domain/entities/notification.dart';
import 'notification_events.dart';
import 'package:flutter/material.dart';

final userNotificationsProvider = StateNotifierProvider.family<UserNotificationsEvent,AsyncValue<List<NotificationEntity>>, BuildContext
>((ref, context) =>  UserNotificationsEvent(context));

final getNotificationsCountProvider = StateNotifierProvider.family<GetNotificationsCountEvent,AsyncValue<int>, BuildContext
>((ref, context) =>  GetNotificationsCountEvent(context));

