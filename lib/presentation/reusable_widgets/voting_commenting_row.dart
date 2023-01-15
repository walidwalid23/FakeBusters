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

class VotingCommentingRow extends ConsumerWidget {
   VotingCommentingRow({Key? key, required this.hasCurrentUserVoted,
   required this.isCurrentUserUploader,
    required this.postID,
   }) : super(key: key);
  bool isCurrentUserUploader;
  bool hasCurrentUserVoted;
  String postID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(isCurrentUserUploader || hasCurrentUserVoted) {
      return ref.watch(getPostVotesProvider(postID)).when(
          data: (data){
          //  print(data.getFakeVotesPercentage());
            print(data.getFakeVotesPercentage());
            print(data.getOriginalVotesPercentage());
            return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              LinearPercentIndicator(
              width: 160.0,
              lineHeight: 37.0,
              percent: double.parse(data.getFakeVotesPercentage())/100,
              center: Text(
                "Fake: ${data.getFakeVotesPercentage()}%",
                style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
              ),
              barRadius: Radius.circular(7),
              backgroundColor: Colors.orangeAccent[100],
              progressColor:ColorsManager.themeColor1,
            ),
                  LinearPercentIndicator(
                    width: 160.0,
                    lineHeight: 37.0,
                    percent: double.parse(data.getOriginalVotesPercentage())/100,
                    center: Text(
                      "Original: ${data.getOriginalVotesPercentage()}%",
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    barRadius: Radius.circular(7),
                    backgroundColor: Colors.orangeAccent[100],
                    progressColor:ColorsManager.themeColor1,
                  ),
                  SizedBox(
                    width: 2,
                  ),


                ]

            );
          },

          error: (error,st)=>Text(error.toString()),
          loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!));
    }
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // THE Fake BUTTON MUST LISTEN TO THE ORIGINAL BUTTON AND THE FAKE BUTTON AS WELL
          ref.watch(incrementOriginalVotesProvider(context)).when(
              data: (data){ if (data==null){
                //initial state
                return  ref.watch(incrementFakeVotesProvider(context)).when(
                    data: (data){ if (data==null){
                      return PostChoiceButton(
                        buttonText: 'Fake',
                        buttonAction: (){
                          ref.read(incrementFakeVotesProvider(context).notifier).IncrementFakeVotesState(postID);
                        },);
                    }
                    else{
                      return  LinearPercentIndicator(
                        width: 160.0,
                        lineHeight: 37.0,
                        percent: double.parse(data.getFakeVotesPercentage())/100,
                        center: Text(
                          "Fake: ${data.getFakeVotesPercentage()}%",
                          style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                        ),
                        barRadius: Radius.circular(7),
                        backgroundColor: Colors.orangeAccent[100],
                        progressColor:ColorsManager.themeColor1,
                      );
                    }
                    },
                    error: (error,st)=>Text(error.toString()),
                    loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!));
              }
              else{
                return  LinearPercentIndicator(
                  width: 160.0,
                  lineHeight: 37.0,
                  percent: double.parse(data.getFakeVotesPercentage())/100,
                  center: Text(
                    "Fake: ${data.getFakeVotesPercentage()}%",
                    style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                  ),
                  barRadius: Radius.circular(7),
                  backgroundColor: Colors.orangeAccent[100],
                  progressColor:ColorsManager.themeColor1,
                );
              }
              },
              error: (error,st)=>Text(error.toString()),
              loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!))
          ,
          SizedBox(
            width: 2,
          ),
          // THE ORIGINAL BUTTON MUST LISTEN TO THE FAKE BUTTON AND THE ORIGINAL BUTTON AS WELL
          ref.watch(incrementFakeVotesProvider(context)).when(
              data: (data){ if (data==null){
                //initial state
                return   ref.watch(incrementOriginalVotesProvider(context)).when(
                    data: (data){ if (data==null){
                      return PostChoiceButton(
                        buttonText: 'Original',
                        buttonAction: (){
                          ref.read(incrementOriginalVotesProvider(context).notifier).incrementOriginalVotesState(postID!);
                        },);
                    }
                    else{
                      return  LinearPercentIndicator(
                        width: 160.0,
                        lineHeight: 37.0,
                        percent: double.parse(data.getOriginalVotesPercentage())/100,
                        center: Text(
                          "Original: ${data.getOriginalVotesPercentage()}%",
                          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        barRadius: Radius.circular(7),
                        backgroundColor: Colors.orangeAccent[100],
                        progressColor:ColorsManager.themeColor1,
                      );
                    }
                    },
                    error: (error,st)=>Text(error.toString()),
                    loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!));
              }
              else{
                return  LinearPercentIndicator(
                  width: 160.0,
                  lineHeight: 37.0,
                  percent: double.parse(data.getOriginalVotesPercentage())/100,
                  center: Text(
                    "Original: ${data.getOriginalVotesPercentage()}%",
                    style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  barRadius: Radius.circular(7),
                  backgroundColor: Colors.orangeAccent[100],
                  progressColor:ColorsManager.themeColor1,
                );
              }
              },
              error: (error,st)=>Text(error.toString()),
              loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!))
          ,

          SizedBox(
            width: 2,
          ),

        ],);
    }
  }
}
