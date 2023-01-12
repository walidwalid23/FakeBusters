import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/server_manager.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/user.dart';
import '../controller/user_providers.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
            'Your Profile',
        ),
        centerTitle: true,
        ),
      drawer: HomeDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

            child: SingleChildScrollView(
              child:
              ref.watch(getUserDataProvider(context)).when(
                  data: (User userData)=>  Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height:10,
                                  ),
                                  CircleAvatar(
                                    foregroundImage:
                                    NetworkImage(ServerManager.baseUrl+"\\"+userData.profileImage
                                    ),
                                    radius:80,
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height:10,
                                  ),
                                  Text(
                                    userData.username,
                                    style: StylesManager.textStyle2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Votes",
                                        style: StylesManager.textStyle2
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      userData.votes.toString(),
                                      style: StylesManager.textStyle2,
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  error: (err,st)=> Text(err.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!))

              ),
            ),
          ),

    );
  }
}
