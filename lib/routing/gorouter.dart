import 'package:fakebustersapp/views/hint.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fakebustersapp/views/Signuppage.dart';
import 'package:fakebustersapp/views/search.dart';
import 'package:fakebustersapp/views/notifications.dart';
import 'package:fakebustersapp/views/Profile.dart';
import 'package:fakebustersapp/views/edit_post.dart';
import 'package:fakebustersapp/views/upload_post.dart';
import 'package:fakebustersapp/views/categories.dart';
import 'package:fakebustersapp/views/display_post.dart';
import 'package:fakebustersapp/views/home.dart';
import 'package:fakebustersapp/views/login_screen.dart';
import 'package:fakebustersapp/views/settings.dart';
final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return DisplayPost();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return ProfileScreen();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return Settings();
      },
    ),
    GoRoute(
      path: '/search',
      builder: (BuildContext context, GoRouterState state) {
        return Search();
      },
    ),
    GoRoute(
      path: '/notifications',
      builder: (BuildContext context, GoRouterState state) {
        return NotificationsScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return SignupScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: '/categories',
      builder: (BuildContext context, GoRouterState state) {
        return Categories();
      },
    ),
    GoRoute(
      path: '/uploadpost',
      builder: (BuildContext context, GoRouterState state) {
        return  UploadPost();
      },
    ),
    GoRoute(
      path: '/displaypost',
      builder: (BuildContext context, GoRouterState state) {
        return DisplayPost();
      },
    ),
    GoRoute(
      path: '/editpost',
      builder: (BuildContext context, GoRouterState state) {
        return EditPost();
      },
    ),
    GoRoute(
      path: '/hintscreen',
      builder: (BuildContext context, GoRouterState state) {
        return HintScreen();
      },
    )

  ],
);