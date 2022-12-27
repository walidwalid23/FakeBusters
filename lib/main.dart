import 'package:fakebustersapp/core/utils/constants/theme_manager.dart';
import 'package:flutter/material.dart';
import 'core/routing/gorouter.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        appBarTheme: AppThemeManager.appBarTheme,
      ),
      title: 'FakeBusters',

    );
  }


}
