// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
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
      drawer: HomeDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
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
                          child:
                          Image.asset(
                              'assets/images/usericon.png',
                          ),
                          radius:80,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                            height:10,
                        ),
                        Text(
                          "Username",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Reviews",
                            style: StylesManager.textStyle2
                          ),
                          Text(
                              "Comments",
                            style: StylesManager.textStyle2
                          ),
                          Text(
                              "Points",
                            style: StylesManager.textStyle2
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
                            style: StylesManager.textStyle2,
                          ),
                          Text(
                              "73",
                              style: StylesManager.textStyle2,
                          ),
                          Text(
                              "18",
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
            ),
          ),
        ),
      ),

    );
  }
}
