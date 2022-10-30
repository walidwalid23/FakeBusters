import 'package:fakebustersapp/Logic/homeLogic.dart';
import 'package:fakebustersapp/reusable_widgets/DefaultButton.dart';
import 'package:fakebustersapp/views/Signuppage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey =GlobalKey<FormState>();
  bool isPassword=true;
@override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style:TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
              DefaultFormField(
                prefix: Icons.email,
                validate: (value) {
                  if (value!.isEmpty) {
                    return "Email must not be empty";
                  }else if(!validator.email(value)){
                    return "Invalid Email Address";
                  }
                  return null;
                },
                Label:"Email*" ,
                type: TextInputType.visiblePassword,
                Controller: emailController,
              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultFormField(
                    suffix: isPassword?Icons.visibility:Icons.visibility_off,
                    icon: (){
                      setState((){
                        isPassword=!isPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      }else if(value.length<8){
                        return "Must be at least 8 characters in length";
                      }
                      return null;
                    },
                    Label:"Password*" ,
                    type: TextInputType.visiblePassword,
                    Controller: passwordController,
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'login',
                    function: (){
                      if(formkey.currentState!.validate()){
                        Fluttertoast.showToast(
                            msg: "Logging in",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb:3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16
                        );
                        context.push('/');
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Don\'t have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/signup');
                        },
                        child: Text(
                            "Register",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
