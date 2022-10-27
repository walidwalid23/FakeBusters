import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  child:
                  Image.asset(
                      'assets/images/usericon.png',
                  ),
                  radius:80,
                  backgroundColor: Colors.white,
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[

                          Container(
                            child:Column(
                              children:[
                                Text("")
                            ],
                            ),
                            decoration: BoxDecoration(
                              color: ColorsManager.themeColor1,

                            ),
                          ),
                        ]
                      )
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
