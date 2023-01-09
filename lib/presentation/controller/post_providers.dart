import 'package:fakebustersapp/presentation/controller/post_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/vote.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/post_choice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/values_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:fakebustersapp/presentation/screens/search.dart';
import 'package:fakebustersapp/presentation/screens/upload_post.dart';
import 'package:fakebustersapp/presentation/screens/user_type_choices.dart';
import 'package:flutter/material.dart';
import '../../core/utils/constants/home_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/vote.dart';
import '../controller/post_providers.dart';


final uploadPostProvider = StateNotifierProvider.family<UploadPostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  UploadPostEvent(context));

final incrementFakeVotesProvider = StateNotifierProvider.family<IncrementFakeVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementFakeVotesEvent(context));

final incrementOriginalVotesProvider = StateNotifierProvider.family<IncrementOriginalVotesEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  IncrementOriginalVotesEvent(context));

final getPostVotesProvider = StateNotifierProvider.family<GetPostVotesEvent,AsyncValue<Vote>, String
>((ref, postID) =>  GetPostVotesEvent(postID));

final deletePostProvider = StateNotifierProvider.family<DeletePostEvent,AsyncValue<dynamic>, BuildContext
>((ref, context) =>  DeletePostEvent(context));


//using autoDispose To reset the state when the user leaves a screen and re-enters it
final findPostsByCategoriesProvider = StateNotifierProvider.autoDispose.family<FindPostsByCategoriesEvent,AsyncValue<List<Post>>,List<String>
>((ref, categories) =>  FindPostsByCategoriesEvent(categories));

final searchPostsByProductNameProvider = StateNotifierProvider.autoDispose.family<SearchPostsByProductNameEvent,AsyncValue<dynamic>,BuildContext
>((ref, context) =>  SearchPostsByProductNameEvent(context));

