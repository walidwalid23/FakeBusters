import 'package:flutter/material.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultButton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/constants/colors_manager.dart';
import '../../domain/entities/user.dart';
import '../controller/user_providers.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../reusable_widgets/image_container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var confirmPass;
  bool showPassword = true;
  bool showConfirmPassword = true;
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
                crossAxisAlignment: CrossAxisAlignment.start,

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
                        return "Username must be at least 3 characters long";
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
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    iconSwitch: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    prefix: Icons.lock,
                    validate: (value) {
                      confirmPass = value;
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      return null;
                    },
                    Label: "Password*",
                    type: TextInputType.visiblePassword,
                    Controller: passwordController,
                    showPassword: showPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextFormField(
                    suffix:
                    showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    iconSwitch: () {
                      setState(() {
                        showConfirmPassword = !showConfirmPassword;
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
                    showPassword: showConfirmPassword,
                  ),
                 SizedBox(height:10),
                  Center(child: ImageContainer(width: 200,height: 200,uploadedImage: userImage,)),
                  Center(
                    child: DefaultButton(text: "Upload Image",width: 200, function: ()async{
                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                      if(image == null){return;}
                      setState(() {
                        userImage = File(image.path);
                        print(image.path);
                      });
                    }),
                  ),
                SizedBox(height:10)
                  ,

                   DefaultButton(
                      text: 'Signup',
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          User user = User(
                              username: usernameController.text,
                              password: passwordController.text,
                              profileImage: userImage);

                          ref.read(userSignUpProvider.notifier).signupState(context, user);




                        }
                      },
                  ),
                ref.watch(userSignUpProvider).when(
                           data: (data)=> Container(),
                           error: (error, trace)=> Center(child: Text(error.toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                          loading: ()=>SpinKitRing(color: ColorsManager.themeColor1!)
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
