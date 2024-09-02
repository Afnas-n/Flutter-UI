import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/darkmode.dart';
import 'package:my_app/Pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dark extends StatefulWidget {
  const Dark({super.key});

  @override
  State<Dark> createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  String ad = Darkmode.darkmode;
  String appText = "";

  @override
  void initState() {
    super.initState();
    darkcall();
  }

  void darkcall() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var dark = sharedPreference.getBool(ad);
    if (dark != null && dark) {
      setState(() {
        appText = "True on app";
      });
    } else {
      setState(() {
        appText = "false on app";
      });
    }
    log("$dark");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appText),
          TextButton(
              onPressed: () async {
                Darkmode dark = Darkmode();
                dark.setDarkmode();
              },
              child: const Text("Click me")),
          TextButton(
              onPressed: () async {
                var share = await SharedPreferences.getInstance();
                share.remove(Darkmode.darkmode).then((value) {
                  log("Loggedout succesfully");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                });
              },
              child: const Text("close"))
        ],
      ),
    );
  }
}
