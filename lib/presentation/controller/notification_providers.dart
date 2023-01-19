import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/notification.dart';
import 'notification_events.dart';
import 'package:flutter/material.dart';

var userNotificationsProvider = StateNotifierProvider<UserNotificationsEvent,AsyncValue<List<NotificationEntity>>
>((ref) =>  UserNotificationsEvent());

final getNotificationsCountProvider = StateNotifierProvider.family<GetNotificationsCountEvent,AsyncValue<int>, WidgetRef
>((ref, widgetRef) =>  GetNotificationsCountEvent(widgetRef));

