import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/user_model.dart';
import 'package:my_app/Pages/signin_page.dart';
import 'package:my_app/custom_Widget/custom_textField.dart';
import 'package:my_app/custom_Widget/custom_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmPass = TextEditingController();
bool showPassword = true;
bool confirmPas = true;
var formkey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  void showicon() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void show1icon() {
    setState(() {
      confirmPas = !confirmPas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              const Text(
                'Sign up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Create Your account'),
              const SizedBox(
                height: 10,
              ),

              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextfield(
                    textController: nameController,
                    textValidator: (value) {
                      if (value!.isEmpty) {
                        return ('username cant be empty');
                      }
                      return null;
                    },
                    textHint: 'Username',
                    iconSi: const Icon(Icons.person),
                    obesCuretext: false,
                  )),

              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextfield(
                    textHint: 'Email',
                    iconSi: const Icon(Icons.email),
                    textController: emailController,
                    textValidator: ((value) =>
                        Validation().emailValidator(value)),
                    obesCuretext: false,
                  )),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextfield(
                  textHint: "Password",
                  iconSi: const Icon(Icons.password),
                  textController: passwordController,
                  textValidator: ((value) =>
                      Validation().passwordValidator(value)),
                  obesCuretext: showPassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        showicon();
                      },
                      icon: showPassword
                          ? const Icon(Icons.visibility_rounded)
                          : const Icon(Icons.visibility_off_rounded)),
                ),
              ),

              //icon password text field
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextfield(
                    textHint: 'Confirm Password',
                    iconSi: const Icon(Icons.password),
                    textController: confirmPass,
                    textValidator: (value) {
                      if (value!.isEmpty) {
                        return 'Empty';
                      }
                      if (value != passwordController.text) {
                        return 'Password not match';
                      }
                      return null;
                    },
                    obesCuretext: confirmPas,
                    suffixIcon: IconButton(
                        onPressed: () {
                          show1icon();
                        },
                        icon: confirmPas
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded)),
                  )),

              //Signup button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[500],
                    fixedSize: const Size.fromWidth(300)),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.reset();
                    try {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((credential) async {
                        String id = credential.user!.uid;
                        UserModel userinfo = UserModel(
                            username: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            id: id);
                        await FirebaseFirestore.instance
                            .collection("Users")
                            .doc(id)
                            .set(userinfo.tojson())
                            .then((onValue) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        });
                      });
                    } catch (e) {
                      print(e);
                    }
                  }
                  // ignore: curly_braces_in_flow_control_structures, avoid_print
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Or'),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.purple),
                      fixedSize: const Size.fromWidth(300)),
                  onPressed: () {},
                  child: const Text('Sign in with Google')),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const Text('Sign in')),
                ],
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
