import 'package:fakebustersapp/presentation/controller/post_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/entities/post.dart';

final uploadPostProvider = StateNotifierProvider.family<UploadPostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  UploadPostEvent(context));

final incrementFakeVotesProvider = StateNotifierProvider.family<IncrementFakeVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementFakeVotesEvent(context));

final incrementOriginalVotesProvider = StateNotifierProvider.family<IncrementOriginalVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementOriginalVotesEvent(context));

final deletePostProvider = StateNotifierProvider.family<DeletePostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  DeletePostEvent(context));

final findPostsByCategoriesProvider = StateNotifierProvider.family<FindPostsByCategoriesEvent,AsyncValue<List<Post>>,List<String>
>((ref, categories) =>  FindPostsByCategoriesEvent(categories));