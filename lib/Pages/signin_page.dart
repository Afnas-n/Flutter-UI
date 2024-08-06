import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/Pages/alert.dart';
import 'package:my_app/Pages/darkmode.dart';
import 'package:my_app/Pages/home_page.dart';
import 'package:my_app/Pages/navigation_bar.dart';
import 'package:my_app/Pages/signup_page.dart';
import 'package:my_app/Pages/text_controller.dart';
import 'package:my_app/custom_Widget/custom_textfield.dart';
import 'package:my_app/custom_Widget/custom_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

var userNameController = TextEditingController();
var signInPasswordController = TextEditingController();
var userSigninkey = GlobalKey<FormState>();
bool showUserPass = true;

class _SignInState extends State<SignIn> {
  void showuserIcon() {
    setState(() {
      showUserPass = !showUserPass;
    });
  }

  // bool dark = false;
  String ad = Darkmode.darkmode;
  String appText = "";
  void darkcall() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var dark = sharedPreference.getBool(ad);
    if (dark != null && dark) {
      appText = "True to app";
    } else {
      appText = "False on App";
    }
    log("$dark");
  }

  @override
  void initState() {
    darkcall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: dark ? Colors.red : Colors.black,
        title: Text(
          appText,
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: userSigninkey,
          child: ListView(shrinkWrap: true, children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 40),
                const Flex(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Enter Your Credential to login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 85),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextfield(
                        textHint: 'Username',
                        iconSi: const Icon(Icons.person),
                        textController: userNameController,
                        textValidator: (value) {
                          if (value!.isEmpty) {
                            return ('Username Cant be empty');
                          }
                          return null;
                        },
                        obesCuretext: false)),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextfield(
                        textHint: 'Password',
                        iconSi: const Icon(Icons.password),
                        textController: signInPasswordController,
                        textValidator: (value) =>
                            Validation().passwordValidator(value),
                        obesCuretext: showUserPass,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showuserIcon();
                            },
                            icon: showUserPass
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded)))),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[500],
                    fixedSize: const Size.fromWidth(310),
                  ),
                  onPressed: () {
                    if (userSigninkey.currentState!.validate())
                      // ignore: curly_braces_in_flow_control_structures, avoid_print
                      print(userNameController.text);
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                TextButton(
                  onPressed: () {
                    Darkmode dark = Darkmode();
                    dark.setDarkmode();
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.purple[500]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                            color: Colors.purple[500],
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyController()));
                        },
                        child: const Text('Text')),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: const Text("home")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigationBarApp()));
                    },
                    child: const Text("navigationbar")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Alert()));
                    },
                    child: Text("Alert"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
