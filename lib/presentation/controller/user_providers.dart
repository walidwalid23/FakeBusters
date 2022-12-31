import 'package:fakebustersapp/presentation/controller/user_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignUpProvider = StateNotifierProvider<UserSignUpEvent, AsyncValue<dynamic>>((ref) => UserSignUpEvent());
final userLoginProvider = StateNotifierProvider<UserLoginEvent, AsyncValue<dynamic>>((ref) => UserLoginEvent());
final verifyUserTokenProvider =
// using provider.family to pass a external constructor parameter to the provider (the buildcontext)
StateNotifierProvider.family<verifyUserTokenEvent, AsyncValue<dynamic>, BuildContext>((ref,BuildContext context) => verifyUserTokenEvent(context));

