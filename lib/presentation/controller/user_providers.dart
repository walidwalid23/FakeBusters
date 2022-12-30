import 'package:fakebustersapp/presentation/controller/user_events.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignUpProvider = StateNotifierProvider<UserSignUpEvent, AsyncValue<dynamic>>((ref) => UserSignUpEvent());
final userLoginProvider = StateNotifierProvider<UserLoginEvent, AsyncValue<dynamic>>((ref) => UserLoginEvent());

