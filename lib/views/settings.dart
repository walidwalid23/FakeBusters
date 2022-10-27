import 'package:fakebustersapp/models/home_manager.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fakebustersapp/reusable_widgets/DefaultButton.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(height: 20.0),
            Text("Darkmode"),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlutterSwitch(
                  width: 100.0,
                  height: 55.0,
                  toggleSize: 45.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeToggleColor: Color.fromARGB(255, 0, 0, 0),
                  inactiveToggleColor: Color.fromARGB(255, 253, 254, 255),
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
              height: 20.0,
            ),
            defaultButton(
              text: 'Signout',
              function: () {},
            ),
          ])),
        ),
        appBar: AppBar(
          title: Text(HomeManager.appSettings),
          centerTitle: true,
        ));
  }
}
