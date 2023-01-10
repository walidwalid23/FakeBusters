import 'package:fakebustersapp/core/utils/constants/theme_manager.dart';
import 'package:fakebustersapp/presentation/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'core/routing/gorouter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(ProviderScope(child:MyApp()));
}

class MyApp extends ConsumerWidget {
    MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme:ref.watch(themeProvider).when(            
            data: (data)=> (data=="light")?AppThemeManager.lightMode:AppThemeManager.darkMode ,
            error: (err, st)=>AppThemeManager.lightMode,
            loading: ()=> AppThemeManager.lightMode)
             
    ,title: 'FakeBusters',);
    

    
    
  }
}
