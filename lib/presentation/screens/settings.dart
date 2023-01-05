import 'package:fakebustersapp/core/utils/constants/home_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import '../controller/user_providers.dart';
import '../reusable_widgets/DefaultFormField.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool status = false;
  bool showPassword = true;
  bool isDarkModeEnabled = false;
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
                    DefaultTextFormField(
                      prefix: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Email must not be empty";
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
                    DefaultTextFormField(
                      suffix:
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      iconSwitch: () {
                        setState(() {
                          showPassword = !showPassword;
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
                      showPassword: showPassword,
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
                        DayNightSwitcher(
                          isDarkModeEnabled: isDarkModeEnabled,
                          onStateChanged: (isDarkModeEnabled) {
                            setState(() {
                              this.isDarkModeEnabled = isDarkModeEnabled;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {              
                        ref.read(userLogoutProvider.notifier).logoutState(context);
                      },
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
                     
                    ),
                    ref.watch(userLogoutProvider).when(
                        data: (data)=> Container(),
                        error: (error, stackTrace)=>Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                        loading:()=> SpinKitRing(color: ColorsManager.themeColor1!))

                  ]
                  ),
                )
                )
                ),
        appBar: AppBar(
          title: Text(HomeManager.appSettings),
          centerTitle: true,
        ));
  }
}
