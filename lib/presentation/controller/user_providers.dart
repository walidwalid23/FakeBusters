import 'dart:js';
import 'package:fakebustersapp/presentation/controller/user_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignUpProvider = StateNotifierProvider<UserSignUpEvent, AsyncValue<dynamic>>((ref) => UserSignUpEvent());

final userLoginProvider = StateNotifierProvider<UserLoginEvent, AsyncValue<dynamic>>((ref) => UserLoginEvent());
// using provider.family to pass a external constructor parameter to the provider (the buildcontext)
final verifyUserTokenProvider = StateNotifierProvider.family<verifyUserTokenEvent, AsyncValue<dynamic>, BuildContext>((ref,BuildContext context) => verifyUserTokenEvent(context));

final userLogoutProvider = StateNotifierProvider<UserLogoutEvent, AsyncValue<dynamic>>((ref) => UserLogoutEvent());

final EditProfileProvider = StateNotifierProvider<EditProfileEvent, AsyncValue<dynamic>>((ref) => EditProfileEvent());

