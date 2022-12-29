import 'dart:io';
import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fakebustersapp/presentation/screens/categories.dart';
import 'package:fakebustersapp/presentation/screens/display_post.dart';
import '../../presentation/screens/Profile.dart';
import '../../presentation/screens/signup_screen.dart';
import '../../presentation/screens/edit_post.dart';
import '../../presentation/screens/home.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/notifications.dart';
import '../../presentation/screens/search.dart';
import '../../presentation/screens/settings.dart';
import '../../presentation/screens/upload_post.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SignupScreen();
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
       return DisplayPost(postData: state.extra as PostModel);
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