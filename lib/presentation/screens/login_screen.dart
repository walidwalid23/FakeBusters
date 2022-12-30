import 'package:fakebustersapp/presentation/controller/user_providers.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/user.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var usernameController = TextEditingController();
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
              DefaultTextFormField(
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
                Controller: usernameController,
              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    suffix: isPassword?Icons.visibility:Icons.visibility_off,
                    iconSwitch: (){
                      setState((){
                        isPassword=!isPassword;
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
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultButton(
                    text: 'login',
                    function: (){
                      if(formkey.currentState!.validate()){
                        User user = User(
                            username: usernameController.text,
                            password: passwordController.text);

                       ref.read(userLoginProvider.notifier).loginState(context, user);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  ref.watch(userLoginProvider).when(
                      data: (data)=>Container(),
                      error: (error, trace)=>Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                      loading: ()=>SpinKitRing(color: ColorsManager.themeColor1!) )

                  ,
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
                            "Register Now",
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
