import 'package:fakebustersapp/presentation/controller/post_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

final uploadPostProvider = StateNotifierProvider.family<UploadPostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  UploadPostEvent(context));
//final IncrementFakeVotesProvider = StateNotifierProvider.family<IncrementFakeVotesEvent,AsyncValue<dynamic>, BuildContext
//>((ref, context) =>  IncrementFakeVotesEvent(context));