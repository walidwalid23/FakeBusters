import 'package:flutter/material.dart';
import 'package:fakebustersapp/presentation/screens/login_screen.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/DefaultButton.dart';
import 'package:go_router/go_router.dart';
import '../reusable_widgets/DefaultFormField.dart';
import 'package:regexed_validator/regexed_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var confirmpass;
  bool isPassword = true;
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
                    "Signup",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultFormField(
                    prefix: Icons.account_circle,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Name must not be empty";
                      }
                      if (!validator.name(value)) {
                        return "Invalid Name";
                      }
                      return null;
                    },
                    Label: "Name*",
                    type: TextInputType.visiblePassword,
                    Controller: nameController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultFormField(
                    prefix: Icons.email,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be empty";
                      }
                      if (!validator.email(value)) {
                        return "Invalid Email Address";
                      }
                      return null;
                    },
                    Label: "Email*",
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
                      confirmpass = value;
                      if (value!.isEmpty) {
                        return "Password must not be empty";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else if (!validator.password(value)) {
                        return "Invalid password";
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
                        return "Password must be atleast 8 characters long";
                      } else if (!validator.password(value)) {
                        return "Invalid password";
                      } else if (value != confirmpass) {
                        return "Password Don't match";
                      }
                      return null;
                    },
                    Label: "Confirm Password*",
                    type: TextInputType.visiblePassword,
                    Controller: confirmpasswordController,
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'Signup',
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
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
