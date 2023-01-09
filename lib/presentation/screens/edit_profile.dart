import 'package:fakebustersapp/domain/entities/updateuser.dart';
import 'package:fakebustersapp/domain/entities/user.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultButton.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultFormField.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_providers.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  @override
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var keyform =GlobalKey<FormState>();
  var userform =GlobalKey<FormState>();
  var passwordform =GlobalKey<FormState>();
  bool showPassword=true;
  late Map<String,String> users;
  late List<Map<String,String>> updated_data;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: keyform,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children:[
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                      "Profile Update",
                  style:
                  TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    key: userform,
                    child: DefaultTextFormField(
                      prefix: Icons.account_circle,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Username must not be empty";
                        }
                        else if (value.length < 3) {
                          return "Username must be at least 3 characters long";
                        }
                        return null;
                      },
                      Label:"Username*" ,
                      type: TextInputType.visiblePassword,
                      Controller:usernameController,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    suffix: showPassword?Icons.visibility:Icons.visibility_off,
                    iconSwitch: (){
                      setState((){
                        showPassword=!showPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      }else if(value.length < 8){
                        return "Password must be at least 8 characters in length";
                      }
                      return null;
                    },
                    Label:"Password*" ,
                    type: TextInputType.visiblePassword,
                    Controller: passwordController,
                    showPassword: showPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultButton(
                    text: 'Update',
                    function: (){
                      if(keyform.currentState!.validate()){
                        users.addAll({"username": usernameController.text});
                        users.addAll({"password":passwordController.text});
                        updated_data.add(users);
                        ref.read(EditProfileProvider.notifier).EditProfileState(updated_data);
                      }else if(userform.currentState!.validate()){
                        users.addAll({"username": usernameController.text});
                        updated_data.add(users);
                        ref.read(EditProfileProvider.notifier).EditProfileState(updated_data);
                      }else if(passwordform.currentState!.validate()){
                        users.addAll({"password":passwordController.text});
                        updated_data.add(users);
                        ref.read(EditProfileProvider.notifier).EditProfileState(updated_data);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: HomeDrawer(),
    );
  }
}
