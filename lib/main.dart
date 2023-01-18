import 'package:fakebustersapp/core/utils/constants/theme_manager.dart';
import 'package:fakebustersapp/presentation/controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routing/gorouter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'domain/entities/post.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // this is the token that is being listened to
  var notificationToken = await FirebaseMessaging.instance.getToken();
  //store the notifier token of this user
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('notificationToken', notificationToken!);

  // This only works when the application is running in the background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) async{
    print("app is opened ");
   // print("the remote message is: ${remoteMessage}");
  //  print("the remote data is: ${remoteMessage.data}");

/*
   appRouter.routerDelegate.navigatorKey.currentContext!
        .push('/notification_post',extra:"63c2b094e614840e0bb952f7");
    */


  });

  


  // Works when the application is closed ( not running in the background)
  FirebaseMessaging.instance.getInitialMessage().then(
          (RemoteMessage? remoteMessage) {
            if(remoteMessage!=null) {
              print("the remote message is: ${remoteMessage}");
        //      print("the remote data is: ${remoteMessage.data}");
            }
            else{
         //     print("app is closed the remote message is null");
            }
          }
  );

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

    ,title: 'FakeBusters',

    );
    

    
    
  }
}
