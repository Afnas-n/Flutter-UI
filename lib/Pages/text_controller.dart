import 'package:flutter/material.dart';

class MyController extends StatefulWidget {
  const MyController({super.key});
  @override
  State<MyController> createState() => _MyControllerState();
}

var name1Controller = TextEditingController();
var password1Controller=TextEditingController();
var form1Key = GlobalKey<FormState>();
bool show1password = true;

class _MyControllerState extends State<MyController> {
 

  @override
  Widget build(BuildContext context) {
     void show1icon() {
    setState(() {
      show1password = !show1password;
    });
  }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[200],
        ),
        body: Form(
            key: form1Key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: name1Controller,
                    validator: (value) {
                      if (value != null) {
                        return ('username cant be empty');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.red[50],
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                        hintText: "Enter the Username"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: password1Controller,
                    validator: (value) {
                      if (value != null) {
                        return ('Password cant be empty');
                      }
                      return null;
                    },
                    obscureText: show1password,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 235, 238, 1),
                        suffixIcon: IconButton(
                            onPressed: () {
                              show1icon();
                            },
                            icon: show1password
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded)),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                        hintText: "Enter the Password"),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                  ),
                  onPressed: () {
                    if (form1Key.currentState!.validate())
                      // ignore: curly_braces_in_flow_control_structures, avoid_print
                      print(name1Controller.text);
                  },
                  child: const Text("Submit"),
                )
              ],
            )));
  }
}
