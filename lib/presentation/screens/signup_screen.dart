import 'package:flutter/material.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultButton.dart';
import 'package:go_router/go_router.dart';
import '../../data/data_source/user_remote_datasource.dart';
import '../../domain/entities/user.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../reusable_widgets/image_container.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var confirmPass;
  bool isPassword = true;
  bool isConfirmPassword = true;
  final ImagePicker _picker = ImagePicker();
  File? userImage;

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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    "SignUp",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    prefix: Icons.account_circle,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "UserName must not be empty";
                      }

                      else if (value.length < 3) {
                        return "Username must be atleast 3 characters long";
                      }

                      return null;
                    },
                    Label: "UserName*",
                    type: TextInputType.visiblePassword,
                    Controller: usernameController,
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    iconSwitch: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) {
                      confirmPass = value;
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      }
                      return null;
                    },
                    Label: "Password*",
                    type: TextInputType.visiblePassword,
                    Controller: passwordController,
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    suffix:
                    isConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    iconSwitch: () {
                      setState(() {
                        isConfirmPassword = !isConfirmPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      }
                      else if (value != confirmPass) {
                        return "Password Don't match";
                      }
                      return null;
                    },
                    Label: "Confirm Password*",
                    type: TextInputType.visiblePassword,
                    Controller: confirmPasswordController,
                    isPassword: isConfirmPassword,
                  ),
                 SizedBox(height:10),
                  ImageContainer(width: 200,height: 200,uploadedImage: userImage,),
                  DefaultButton(text: "Upload Image",width: 200, function: ()async{
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image == null){return;}
                    setState(() {
                      userImage = File(image.path);
                      print(image.path);
                    });
                  }),
                SizedBox(height:10)
                  ,

                  DefaultButton(
                    text: 'Signup',
                    function: () async{
                      if (formKey.currentState!.validate()) {
                        User user = User(username: usernameController.text,
                        password: passwordController.text,
                        profileImage: userImage);

                        bool signedUp = await UserRemoteDataSource().signUp(user);


                        context.push('/');
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
