import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/models/theme_manager.dart';
import 'package:fakebustersapp/views/Profile.dart';
import 'package:fakebustersapp/views/edit_post.dart';
import 'package:fakebustersapp/views/upload_post.dart';
import 'package:fakebustersapp/views/categories.dart';
import 'package:fakebustersapp/views/display_post.dart';
import 'package:fakebustersapp/views/home.dart';
import 'package:fakebustersapp/views/login_screen.dart';
import 'package:fakebustersapp/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/views/Signuppage.dart';
import 'package:fakebustersapp/views/search.dart';
import 'package:fakebustersapp/views/notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
 
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppThemeManager.appBarTheme,
      ),
      title: 'FakeBusters',
      routes: {'/home':(context)=> Home(),
        '/profile':(context)=> ProfileScreen(),
        '/settings':(context)=> Settings(),
        '/search':(context)=> Search(),
        '/notifications':(context)=> NotificationsScreen(),
        '/signup':(context)=> SignupScreen(),
        '/login':(context)=> LoginScreen(),
        '/categories':(context)=> Categories(),
        '/uploadpost':(context)=> UploadPost(),
        '/displaypost':(context)=> DisplayPost(),
        '/editpost':(context)=>EditPost(),
      },
      initialRoute:'/home' ,
    );
  }
}
