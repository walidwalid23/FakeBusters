import 'package:fakebustersapp/models/theme_manager.dart';
import 'package:flutter/material.dart';
import 'routing/gorouter.dart';


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
