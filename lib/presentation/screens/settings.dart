import 'package:fakebustersapp/core/utils/constants/home_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/Navigation_rail.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import '../controller/theme_provider.dart';
import '../controller/user_providers.dart';
import '../reusable_widgets/DefaultFormField.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool status = false;
  bool showPassword = true;
  bool? isDarkModeEnabled;
  var formKey = GlobalKey<FormState>();
  Map<String,String> updatedData = {};



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        drawer: HomeDrawer(),
        body: SafeArea(
            child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(children: [
                    Text(
                      "Personal Settings",
                      style: TextStyle(
                        fontSize: 30,
                        height: 2.0,
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
                        prefix: Icons.supervised_user_circle,
                        validate: (value) {
                          if (value.length < 3 && value.length!=0) {
                            return "Username must be at least 3 characters long";
                          }
                          // if both password and username are empty
                          if(value.length==0 && passwordController.text.length==0){
                            return "You Cannot Leave All Fields Empty";
                          }
                          return null;
                        },
                        hintText: "Update Username",
                        type: TextInputType.visiblePassword,
                        Controller: usernameController,
                      ),

                    SizedBox(
                      height: 20.0,
                    ),
                 DefaultTextFormField(
                        suffix: showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        iconSwitch: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        prefix: Icons.lock,
                        validate: (value) {
                          if(value.length < 8 && value.length!=0){
                            return "Password must be at least 8 characters in length";
                          }
                          // if both password and username are empty
                          if(value.length==0 && usernameController.text.length==0){
                            return "You Cannot Leave All Fields Empty";
                          }
                          return null;
                        },
                        hintText: "Update Password",
                        type: TextInputType.visiblePassword,
                        Controller: passwordController,
                        showPassword: showPassword,
                      ),
                     SizedBox(height:17),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, right: 80),
                      child: ElevatedButton(
                        onPressed: () {
                        // EDIT PROFILE
                          if(formKey.currentState!.validate()){
                            // FIELD IS VALID IF ITS EMPTY OR HAS VALID INPUTS
                            if(usernameController.text.length > 0){
                              updatedData.addAll({"username":usernameController.text });
                            }
                            else if (usernameController.text.length==0){
                              updatedData.remove("username");
                            }
                            if(passwordController.text.length > 0){
                              updatedData.addAll({"password":passwordController.text });
                            }
                            else if (passwordController.text.length==0){
                              updatedData.remove("password");
                            }

                        ref.read(editProfileProvider(context).notifier).editProfileState(updatedData);

                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            "Submit",
                            style: StylesManager.textStyle1,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.themeColor1,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:17),

                    ref.watch(editProfileProvider(context)).when(
                        data: (successMessage)=> successMessage==null?Container() :
                        Center(child: Text(successMessage.toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)),
                        error: (error, trace)=> Center(child: Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                        loading: ()=> SpinKitRing(color: ColorsManager.themeColor1!))
                    ,
                    Text(
                      "App Settings",
                      style: TextStyle(
                        fontSize: 30,
                        height: 3,
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
                        Text('Which mode do you prefer?',
                          style: TextStyle(
                            fontSize: 21,
                            height: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  // SET THE INITIAL THEME BUTTON
                  ref.watch(themeProvider).when(
                      data: (data){ if(data=="light"){
                        isDarkModeEnabled=false;
                        return  DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled!,
                onStateChanged: (isDarkModeEnabled) {
                setState(() {
                this.isDarkModeEnabled = isDarkModeEnabled;
                ref.read(themeProvider.notifier).setThemeState(
                isDarkModeEnabled ? 'dark' : 'light');
                });
                },
                ); }
                      else{
                        isDarkModeEnabled =true;
                        return  DayNightSwitcher(
                          isDarkModeEnabled: isDarkModeEnabled!,
                          onStateChanged: (isDarkModeEnabled) {
                            setState(() {
                              this.isDarkModeEnabled = isDarkModeEnabled;
                              ref.read(themeProvider.notifier).setThemeState(
                                  isDarkModeEnabled ? 'dark' : 'light');
                            });
                          },
                        );
                      }
                      },
                      error: (err, st)=>Text(err.toString()),
                      loading: ()=>  SpinKitRing(color: ColorsManager.themeColor1!))
                      ,

                      ],
                    ),
                    SizedBox(
                      height: 100.0,
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
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    ref.watch(userLogoutProvider).when(
                        data: (data) => Container(),
                        error: (error, stackTrace) => Text(
                              error.toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                        loading: () =>
                            SpinKitRing(color: ColorsManager.themeColor1!))
                  ]),
                ))),
        appBar: AppBar(
          title: Text(HomeManager.appSettings),
          centerTitle: true,
        ));
  }
}
