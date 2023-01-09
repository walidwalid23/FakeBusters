import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:fakebustersapp/domain/entities/uploaded_post.dart';
import 'package:fakebustersapp/presentation/screens/hint.dart';
import 'package:fakebustersapp/presentation/screens/tablet_categories.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fakebustersapp/presentation/screens/categories.dart';
import 'package:fakebustersapp/presentation/screens/display_post.dart';
import '../../presentation/screens/Profile.dart';
import '../../presentation/screens/initial_loading_screen.dart';
import '../../presentation/screens/posts_screen.dart';
import '../../presentation/screens/signup_screen.dart';
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
        return TabletCategories();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return Home();
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
        return LayoutBuilder(
          builder:(BuildContext context, BoxConstraints constraints){
            print(constraints.minWidth.toInt());
            if(constraints.minWidth.toInt()>=807){
              return TabletCategories();
            }
            return Categories();
          },
        );
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
       return DisplayPost(postData: state.extra as UploadedPost);
      },
    ),

    GoRoute(
      path: '/hintscreen',
      builder: (BuildContext context, GoRouterState state) {
        return HintScreen();
      },
    ),
    GoRoute(
      path: '/posts_screen',
      builder: (BuildContext context, GoRouterState state) {
        return  PostsScreen(categories: state.extra as List<String>);
      },
    ),


  ],
);