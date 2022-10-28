import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
            'Your Profile',
        ),
        centerTitle: true,
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child:
                        Image.asset(
                            'assets/images/usericon.png',
                        ),
                        radius:80,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height:10),
                      Text("Username",style: StylesManager.textStyle1,)
                    ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Applied",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                              "Reviewed",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                              "Contacted",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "28",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                              "73",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                          ),
                          Text(
                              "18",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Achivements",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Container(
                            child:Column(
                              children:[
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "MileStone Achieved",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                     IconButton(
                                        icon:Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 20,
                                        ),
                                        onPressed: () {

                                        },
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Next Level",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                      ),
                                    ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: ColorsManager.themeColor1,
                              borderRadius: BorderRadius.circular(10),

                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
