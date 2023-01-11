import 'package:fakebustersapp/presentation/controller/post_events.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/vote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final uploadPostProvider = StateNotifierProvider.family<UploadPostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  UploadPostEvent(context));

final incrementFakeVotesProvider = StateNotifierProvider.family<IncrementFakeVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementFakeVotesEvent(context));

final incrementOriginalVotesProvider = StateNotifierProvider.family<IncrementOriginalVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementOriginalVotesEvent(context));

final getPostVotesProvider = StateNotifierProvider.family<GetPostVotesEvent,AsyncValue<Vote>, String
>((ref, postID) =>  GetPostVotesEvent(postID));


final getPostByIDProvider = StateNotifierProvider.family<GetPostByIDEvent,AsyncValue<Post>, String
>((ref, postID) =>  GetPostByIDEvent(postID));

//using autoDispose To reset the state when the user leaves a screen and re-enters it
final findPostsByCategoriesProvider = StateNotifierProvider.autoDispose.family<FindPostsByCategoriesEvent,AsyncValue<List<Post>>,List<String>
>((ref, categories) =>  FindPostsByCategoriesEvent(categories));

final searchPostsByProductNameProvider = StateNotifierProvider.autoDispose.family<SearchPostsByProductNameEvent,AsyncValue<dynamic>,BuildContext
>((ref, context) =>  SearchPostsByProductNameEvent(context));

