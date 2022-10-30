import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/models/theme_manager.dart';
import 'package:fakebustersapp/views/Profile.dart';
import 'package:fakebustersapp/views/edit_post.dart';
import 'package:fakebustersapp/views/hint.dart';
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
      routes: {'/home':(context)=> Home(), //Waleed
        '/profile':(context)=> ProfileScreen(),//Sherif
        '/settings':(context)=> Settings(),//Abdelrahman
        '/search':(context)=> Search(),//Adham
        '/notifications':(context)=> NotificationsScreen(),//Waleed
        '/signup':(context)=> SignupScreen(),//Abdelrahman
        '/login':(context)=> LoginScreen(),//Sherif
        '/categories':(context)=> Categories(),//Waleed
        '/uploadpost':(context)=> UploadPost(),//Waleed
        '/displaypost':(context)=> DisplayPost(),//Waleed
        '/editpost':(context)=>EditPost(),//Sherif
        '/hint':(context)=>HintScreen(),//Sherif
      },
      initialRoute:'/hint' ,
    );
  }
}
