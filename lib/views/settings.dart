// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, unused_import, unused_field

import 'package:fakebustersapp/models/home_manager.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fakebustersapp/reusable_widgets/DefaultButton.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'package:regexed_validator/regexed_validator.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool status = false;
  bool isPassword = true;
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;
  var formkey = GlobalKey<FormState>();
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
        body: SafeArea(
            child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(children: [
                    Text(
                      "Personal Settings",
                      style: TextStyle(
                        fontSize: 30,
                        height: 2.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 0,
                      endIndent: 150,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DefaultFormField(
                      prefix: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Email must not be empty";
                        } else if (!validator.email(value)) {
                          return "Invalid Email Address";
                        }
                        return null;
                      },
                      Label: "Update Email",
                      type: TextInputType.visiblePassword,
                      Controller: emailController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    DefaultFormField(
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      icon: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      prefix: Icons.lock,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        } else if (value.length < 8) {
                          return "Must be at least 8 characters in length";
                        }
                        return null;
                      },
                      Label: "Update Password",
                      type: TextInputType.visiblePassword,
                      Controller: passwordController,
                      isPassword: isPassword,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "Submit",
                          style: StylesManager.textStyle1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.themeColor1),
                    ),
                    Text(
                      "App Settings",
                      style: TextStyle(
                        fontSize: 30,
                        height: 3,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 0,
                      endIndent: 150,
                      color: Colors.deepOrange,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Which mode do you prefer?',
                          style: TextStyle(
                            fontSize: 21,
                            height: 0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlutterSwitch(
                          width: 100.0,
                          height: 55.0,
                          toggleSize: 45.0,
                          value: status,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeToggleColor: Color.fromARGB(255, 0, 0, 0),
                          inactiveToggleColor:
                              Color.fromARGB(255, 253, 254, 255),
                          activeSwitchBorder: Border.all(
                            color: Color.fromARGB(255, 73, 71, 71),
                            width: 6.0,
                          ),
                          inactiveSwitchBorder: Border.all(
                            color: Color.fromARGB(255, 227, 230, 233),
                            width: 6.0,
                          ),
                          activeColor: Color.fromARGB(255, 2, 2, 2),
                          inactiveColor: Color.fromARGB(255, 245, 239, 239),
                          activeIcon: Icon(
                            Icons.nightlight_round,
                            color: Color.fromARGB(255, 255, 254, 251),
                          ),
                          inactiveIcon: Icon(
                            Icons.wb_sunny,
                            color: Color(0xFFFFDF5D),
                          ),
                          onToggle: (val) {
                            setState(() {
                              status = val;
                              if (val) {
                                _textColor = Colors.white;
                                _appBarColor = Color.fromRGBO(22, 27, 34, 1);
                                _scaffoldBgcolor = Color(0xFF0D1117);
                              } else {
                                _textColor = Colors.black;
                                _appBarColor = Color.fromRGBO(36, 41, 46, 1);
                                _scaffoldBgcolor = Colors.white;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.logout_rounded),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text('Signout'),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.themeColor1,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                    )
                  ]),
                ))),
        appBar: AppBar(
          title: Text(HomeManager.appSettings),
          centerTitle: true,
        ));
  }
}
