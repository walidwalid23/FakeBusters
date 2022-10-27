import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/models/theme_manager.dart';
import 'package:fakebustersapp/views/home.dart';
import 'package:fakebustersapp/views/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme:AppThemeManager.appBarTheme,),
      title: 'FakeBusters',
      home: Home(),
    );
  }
}


